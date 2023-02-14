import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cornie_app/constants/colors.dart';
import 'package:cornie_app/screens/detail/components/heroSection/ratingDialog.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../models/movieModel.dart';
import '../../../../models/theaterDetail.dart';
import '../../../../models/userModel.dart';

class HeroSection extends StatefulWidget {
  HeroSection({super.key, required this.id, required this.userId});
  String id;
  String userId;

  @override
  State<HeroSection> createState() => _HeroSectionState();
} /*  */

class _HeroSectionState extends State<HeroSection> {
  MovieModel movie = MovieModel(
      id: '',
      ageLimit: '',
      name: '',
      description: '',
      duration: '',
      poster: '',
      image: '',
      startTime: '',
      type: '',
      typeSub: '',
      actorList: [],
      director: [],
      publisher: []);

  Future getMovie() async {
    FirebaseFirestore.instance
        .collection("movies")
        .where('id', isEqualTo: widget.id)
        .snapshots()
        .listen((value) {
      setState(() {
        movie = MovieModel.fromDocument(value.docs.first.data());
      });
    });
  }

  userModel user = userModel(
      id: '',
      email: '',
      fullName: '',
      userName: '',
      phoneNumber: '',
      avatar: '',
      favoriteList: [],
      saveList: [],
      role: '',
      gender: '',
      dob: '');
  Future getUserDetail() async {
    FirebaseFirestore.instance
        .collection("users")
        .where("id", isEqualTo: widget.userId)
        .snapshots()
        .listen((value) {
      setState(() {
        user = userModel.fromDocument(value.docs.first.data());
        if (user.favoriteList.contains(widget.id)) {
          setState(() {
            liked = true;
          });
        }
      });
    });
  }

  @override
  void initState() {
    getMovie();
    getUserDetail();
    super.initState();
  }

  bool liked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 360,
        decoration: const BoxDecoration(color: AppColors.alt900),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
                margin: const EdgeInsets.only(left: 24, top: 30),
                child: const Icon(
                  Iconsax.back_square,
                  size: 28,
                  color: AppColors.white,
                )),
          ),
          Container(
            margin: const EdgeInsets.only(left: 24, top: 30),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              child: Image.network(movie.poster,
                  width: 200, height: 260, fit: BoxFit.cover),
            ),
          ),
          Container(
              margin: EdgeInsets.only(left: 24, bottom: 24, top: 30),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(movie.name,
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            color: AppColors.white)),
                    SizedBox(height: 8),
                    Text(movie.name,
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            color: AppColors.alt100)),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        ElevatedButton.icon(
                          icon: Icon(
                            Icons.favorite,
                            size: 15,
                          ),
                          onPressed: () {
                            if (liked == false) {
                              if (widget.userId != '') {
                                FirebaseFirestore.instance
                                    .collection("users")
                                    .doc(widget.userId)
                                    .update({
                                  'favoriteList':
                                      FieldValue.arrayUnion([widget.id])
                                });
                                setState(() {
                                  liked = !liked;
                                });
                              }
                            } else {
                              if (widget.userId != '') {
                                FirebaseFirestore.instance
                                    .collection("users")
                                    .doc(widget.userId)
                                    .update({
                                  'favoriteList':
                                      FieldValue.arrayRemove([widget.id])
                                });
                                setState(() {
                                  liked = !liked;
                                });
                              }
                            }
                          },
                          label: Text('Thích'),
                          style: ElevatedButton.styleFrom(
                            // elevation: 18,
                            // shadowColor: Colors.white,
                            primary: AppColors.alt300,
                            onPrimary: liked
                                ? Color.fromARGB(255, 251, 95, 74)
                                : AppColors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                        SizedBox(width: 16),
                        ElevatedButton.icon(
                          icon: Icon(
                            Icons.star,
                            size: 15,
                          ),
                          onPressed: () {
                            if (widget.userId != '') {
                              showRatingDialog(context, widget.id,
                                  widget.userId, user.fullName, movie.name);
                            }
                          },
                          label: Text('Đánh giá'),
                          style: ElevatedButton.styleFrom(
                            // elevation: 18,
                            // shadowColor: Colors.white,
                            primary: AppColors.alt300,
                            onPrimary: AppColors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Container(
                        width: 600,
                        height: 300 - 165 - 24,
                        child: Text(movie.description,
                            maxLines: 5,
                            style: TextStyle(
                                height: 1.3,
                                fontSize: 16,
                                overflow: TextOverflow.ellipsis,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w300,
                                color: AppColors.white))),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 24,
                                  width: 24,
                                  child: Center(
                                    child: Icon(
                                      Iconsax.like,
                                      color: AppColors.white,
                                      size: 20,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 8),
                                Text('Hài lòng',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.white)),
                              ],
                            ),
                            SizedBox(height: 8),
                            Container(
                              margin: EdgeInsets.only(left: 24 + 8),
                              child: Text('90%',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w300,
                                      color: AppColors.white)),
                            ),
                          ],
                        ),
                        SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const SizedBox(
                                  height: 24,
                                  width: 24,
                                  child: Center(
                                    child: Icon(
                                      Iconsax.calculator,
                                      color: AppColors.white,
                                      size: 20,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 8),
                                Text('Khởi chiếu',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.white)),
                              ],
                            ),
                            SizedBox(height: 8),
                            Container(
                              margin: EdgeInsets.only(left: 24 + 8),
                              child: Text('10/11/2022',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w300,
                                      color: AppColors.white)),
                            ),
                          ],
                        ),
                        SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 24,
                                  width: 24,
                                  child: const Center(
                                    child: Icon(
                                      Iconsax.timer_start,
                                      color: AppColors.white,
                                      size: 20,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                const Text('Thời lượng',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.white)),
                              ],
                            ),
                            SizedBox(height: 8),
                            Container(
                              margin: EdgeInsets.only(left: 24 + 8),
                              child: Text(movie.duration + ' phút',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w300,
                                      color: AppColors.white)),
                            ),
                          ],
                        ),
                        SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 24,
                                  width: 24,
                                  child: const Center(
                                    child: Icon(
                                      Iconsax.user_tick,
                                      color: AppColors.white,
                                      size: 20,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 8),
                                Text('Giới hạn tuổi',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.white)),
                              ],
                            ),
                            SizedBox(height: 8),
                            Container(
                              margin: EdgeInsets.only(left: 24 + 8),
                              child: Text('NC' + movie.ageLimit,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w300,
                                      color: AppColors.white)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ])),
          SizedBox(width: 24),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 90),
                  Text('Diễn viên',
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          color: AppColors.white)),
                  SizedBox(height: 8),
                  Text(movie.actorList[0],
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w300,
                          color: AppColors.white)),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Text('Đạo diễn',
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          color: AppColors.white)),
                  SizedBox(height: 8),
                  Text(movie.director[0],
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w300,
                          color: AppColors.white)),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Text('Nhà sản xuất',
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          color: AppColors.white)),
                  SizedBox(height: 8),
                  Text(movie.publisher[0],
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w300,
                          color: AppColors.white)),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Text('Vũ trụ điện ảnh',
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          color: AppColors.white)),
                  SizedBox(height: 8),
                  Text("Marvel Cinematic Universe",
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w300,
                          color: AppColors.white)),
                ],
              ),
            ],
          ),
        ]));
  }
}
