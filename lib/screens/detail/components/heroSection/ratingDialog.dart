import 'package:awesome_rating/awesome_rating.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cornie_app/constants/colors.dart';
import 'package:cornie_app/controller/authenController.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rating_summary/rating_summary.dart';

showRatingDialog(BuildContext mContext, String idMovie, String idUser,
    String userName, String movieName) {
  double rating = 0.0;
  return showDialog(
      context: mContext,
      builder: (context) {
        return StatefulBuilder(
            builder: (BuildContext mcontext, StateSetter setState) {
          return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              backgroundColor: AppColors.white,
              content: Container(
                  height: 160,
                  padding:
                      EdgeInsets.only(top: 14, bottom: 14, right: 24, left: 24),
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      // RatingSummary(
                      //   counter: 13,
                      //   average: 3.846,
                      //   showAverage: true,
                      //   counterFiveStars: 5,
                      //   counterFourStars: 4,
                      //   counterThreeStars: 2,
                      //   counterTwoStars: 1,
                      //   counterOneStars: 1,
                      // ),
                      // SizedBox(height: 16),
                      AwesomeStarRating(
                        starCount: 5,
                        rating: rating,
                        size: 30.0,
                        onRatingChanged: (double value) {
                          setState(() {
                            rating = value;
                          });
                        },
                        color: Colors.orange,
                        borderColor: Colors.orange,
                      ),
                      SizedBox(height: 16),
                      Container(
                        width: 327 + 24,
                        height: 44,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          color: AppColors.grey900,
                        ),
                        child: ElevatedButton(
                          //action navigate to dashboard screen
                          onPressed: () async {
                            FirebaseFirestore.instance
                                .collection('community')
                                .add({
                              'idOwner': idUser,
                              'idMovie': idMovie,
                              'rating': rating.toString(),
                              'title': userName +
                                  " đã đánh giá " +
                                  rating.toString() +
                                  " sao vàng cho phim " +
                                  movieName,
                              'timeCreate':
                                  "${DateFormat('y MMMM d, hh:mm:ss').format(DateTime.now())}",
                            }).then((value) {
                              FirebaseFirestore.instance
                                  .collection('community')
                                  .doc(value.id)
                                  .update({'id': value.id});
                            });
                            FirebaseFirestore.instance
                                .collection('movies')
                                .doc(idMovie)
                                .collection('ratings')
                                .add({
                              'idOwner': idUser,
                              'idMovie': idMovie,
                              'rating': rating.toString(),
                              'title': userName +
                                  " đã đánh giá " +
                                  rating.toString() +
                                  " sao vàng cho phim " +
                                  movieName,
                              'timeCreate':
                                  "${DateFormat('y MMMM d, hh:mm:ss').format(DateTime.now())}",
                            }).then((value) {
                              FirebaseFirestore.instance
                                  .collection('movies')
                                  .doc(idMovie)
                                  .collection('ratings')
                                  .doc(value.id)
                                  .update({'id': value.id});

                              Navigator.pop(context);
                            });
                          },
                          style: ElevatedButton.styleFrom(
                              primary: AppColors.grey900,
                              onPrimary: Colors.white,
                              shadowColor: AppColors.grey900.withOpacity(0.25),
                              elevation: 15,
                              animationDuration: Duration(milliseconds: 300),
                              // maximumSize: Size.fromWidth(200),
                              minimumSize: const Size(327 + 24, 44),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16.0)),
                              // BorderRadius.all(Radius.circular(16)),
                              textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18)),
                          child: Container(
                            alignment: Alignment.center,
                            child: const Text(
                              'Hoàn Tất',
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'Urbanist',
                                fontWeight: FontWeight.w600,
                                color: AppColors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )));
        });
      });
}
