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
showTimeDialog(BuildContext mContext, List<ScheduleModel> scheduleListChoice,
    List<MovieModel> moviesList) {
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
                SizedBox(
                    height: 648 * 2,
                    width: 648,
                    child: Padding(
                        padding: const EdgeInsets.all(0),
                        // padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                        child: Column(
                          children: [
                            Container(
                              width: 648,
                              height: 84,
                              child: ListView.builder(
                                  itemCount: dateList.length,
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return InkWell(
                                        onTap: () {
                                          setState(() {
                                            itemChosed = index;
                                          });
                                        },
                                        child: (index == dateList.length - 1)
                                            ? Center(
                                                child: (ItemDateEnd(
                                                    date: dateList[index],
                                                    dayName: 'Thứ 3',
                                                    picked:
                                                        (itemChosed == index)
                                                            ? true
                                                            : false)),
                                              )
                                            : ((index == 0)
                                                ? Center(
                                                    child: (ItemDateHead(
                                                        date: dateList[index],
                                                        dayName: 'Thứ 3',
                                                        picked: (itemChosed ==
                                                                index)
                                                            ? true
                                                            : false)),
                                                  )
                                                : Center(
                                                    child: (ItemDate(
                                                        date: dateList[index],
                                                        dayName: 'Thứ 3',
                                                        picked: (itemChosed ==
                                                                index)
                                                            ? true
                                                            : false)),
                                                  )));
                                  }),
                            ),
                            const SizedBox(height: 24),
                            Container(
                              height: 4,
                              width: 648,
                              color: AppColors.alt700,
                            ),
                            const SizedBox(height: 24),
                            const Notation(),
                            const SizedBox(height: 24),
                            ListView.builder(
                                itemCount: moviesList.length,
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                itemBuilder: (BuildContext context, int index) {
                                  return Container(
                                    width: 648,
                                    decoration: const BoxDecoration(
                                        color: AppColors.grey100,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8))),
                                    child: Container(
                                      margin: EdgeInsets.only(top: 24),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: ((context) =>
                                                          DetailMovie(
                                                              id: moviesList[
                                                                      index]
                                                                  .id))));
                                            },
                                            child: Container(
                                              width: 100,
                                              height: 160,
                                              margin: EdgeInsets.only(
                                                  left: 24, bottom: 24),
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                      moviesList[index].poster,
                                                    ),
                                                    fit: BoxFit.cover),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(8)),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                                left: 24, bottom: 24),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(moviesList[index].name,
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color:
                                                            AppColors.grey900)),
                                                SizedBox(height: 8),
                                                Text(
                                                    '${moviesList[index].name} · NC${moviesList[index].ageLimit}  · ${moviesList[index].duration} ',
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color:
                                                            AppColors.grey700)),
                                                SizedBox(height: 16),
                                                Row(
                                                  children: [
                                                    Container(
                                                      height: 24,
                                                      width: 24,
                                                      decoration: const BoxDecoration(
                                                          color:
                                                              AppColors.alt300,
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          4))),
                                                      child: Center(
                                                        child: Image.network(
                                                          'https://i.imgur.com/dPsWVM2.png',
                                                          fit: BoxFit.contain,
                                                          height: 16,
                                                          width: 16,
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      height: 24,
                                                      padding: EdgeInsets.only(
                                                          left: 6, right: 6),
                                                      margin: EdgeInsets.only(
                                                          left: 8),
                                                      decoration: const BoxDecoration(
                                                          color:
                                                              AppColors.alt300,
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          4))),
                                                      child: Center(
                                                        child: Text(
                                                            moviesList[index]
                                                                .type,
                                                            style: const TextStyle(
                                                                fontSize: 12,
                                                                fontFamily:
                                                                    'Poppins',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                color: AppColors
                                                                    .grey900)),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                const SizedBox(height: 16),
                                                Text(moviesList[index].typeSub,
                                                    style: const TextStyle(
                                                        fontSize: 18,
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color:
                                                            AppColors.grey900)),
                                                const SizedBox(height: 16),
                                                SizedBox(
                                                  height: 88,
                                                  child: ListView.builder(
                                                      itemCount:
                                                          scheduleListChoice
                                                              .length,
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      shrinkWrap: true,
                                                      itemBuilder:
                                                          (BuildContext context,
                                                              int index) {
                                                        return ScheduleFilmCard(
                                                          hour:
                                                              (scheduleListChoice[
                                                                          index]
                                                                      .timeStart)
                                                                  .toString(),
                                                          picked: false,
                                                          price:
                                                              scheduleListChoice[
                                                                          index]
                                                                      .price +
                                                                  'K',
                                                          state: (scheduleListChoice[
                                                                          index]
                                                                      .timeStart ==
                                                                  DateFormat(
                                                                          'HH:mm')
                                                                      .format(DateTime
                                                                          .now())
                                                                      .toString())
                                                              ? 'Play'
                                                              : 'Played',
                                                        );
                                                      }),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                })
                          ],
                        )))
              ]));
        });
      });
}
