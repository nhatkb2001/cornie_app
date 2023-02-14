import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cornie_app/constants/colors.dart';
import 'package:cornie_app/models/scheduleModel.dart';
import 'package:cornie_app/screens/dashboard/components/showtime_section/film/schedule_film_card.dart';
import 'package:cornie_app/screens/dashboard/components/showtime_section/movie_notation/notation.dart';
import 'package:cornie_app/screens/dashboard/components/showtime_section/schedule/dateCard.dart';
import 'package:cornie_app/screens/dashboard/components/showtime_section/schedule/dateCardEnd.dart';
import 'package:cornie_app/screens/dashboard/components/showtime_section/schedule/dateCardHead.dart';
import 'package:cornie_app/screens/detail/detailMovie.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

import '../../../../../models/movieModel.dart';

late DateTime date = DateTime.now();
int itemChosed = 0;

String currentTime = DateFormat('dd/MM').format(DateTime(
    DateTime.now().year, DateTime.now().month, DateTime.now().day - 1));
List dateList = [
  DateFormat('dd/MM').format(
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day)),
  DateFormat('dd/MM').format(DateTime(
      DateTime.now().year, DateTime.now().month, DateTime.now().day + 1)),
  DateFormat('dd/MM').format(DateTime(
      DateTime.now().year, DateTime.now().month, DateTime.now().day + 2)),
  DateFormat('dd/MM').format(DateTime(
      DateTime.now().year, DateTime.now().month, DateTime.now().day + 3)),
  DateFormat('dd/MM').format(DateTime(
      DateTime.now().year, DateTime.now().month, DateTime.now().day + 4)),
  DateFormat('dd/MM').format(DateTime(
      DateTime.now().year, DateTime.now().month, DateTime.now().day + 5)),
  DateFormat('dd/MM').format(DateTime(
      DateTime.now().year, DateTime.now().month, DateTime.now().day + 6)),
];
showCreateContentDialog(BuildContext mContext, String userId) {
  TextEditingController contentController = TextEditingController();
  return showDialog(
      context: mContext,
      builder: (context) {
        return StatefulBuilder(
            builder: (BuildContext mcontext, StateSetter setState) {
          return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              backgroundColor: AppColors.white,
              content: Stack(alignment: Alignment.topCenter, children: [
                Container(
                    height: 200,
                    padding: EdgeInsets.all(14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          "Write your content",
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              color: AppColors.grey900),
                        ),
                        SizedBox(height: 8),
                        Container(
                          alignment: Alignment.center,
                          child: Form(
                            // key: formKey,
                            child: Container(
                              width: 400,
                              height: 48,
                              padding: EdgeInsets.only(
                                  left: 10, right: 10, bottom: 12),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: AppColors.white,
                                  border: Border.all(color: AppColors.grey500)),
                              child: TextFormField(
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 16,
                                      color: AppColors.grey900,
                                      fontWeight: FontWeight.w400),
                                  controller: contentController,
                                  keyboardType: TextInputType.text,
                                  onChanged: (val) {},
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                  )),
                            ),
                          ),
                        ),
                        SizedBox(height: 24),
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
                              Navigator.pop(context, contentController.text);
                            },
                            style: ElevatedButton.styleFrom(
                                primary: AppColors.grey900,
                                onPrimary: Colors.white,
                                shadowColor:
                                    AppColors.grey900.withOpacity(0.25),
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
                                'Save',
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
                    ))
              ]));
        });
      });
}
