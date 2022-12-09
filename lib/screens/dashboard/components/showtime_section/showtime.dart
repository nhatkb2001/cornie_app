import 'package:cornie_app/constants/colors.dart';
import 'package:cornie_app/screens/dashboard/components/showtime_section/schedule/dateCard.dart';
import 'package:cornie_app/screens/dashboard/components/showtime_section/schedule/dateCardEnd.dart';
import 'package:cornie_app/screens/dashboard/components/showtime_section/schedule/dateCardHead.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

import 'film/filmCard.dart';
import 'movie_notation/notation.dart';

class ShowTime extends StatefulWidget {
  const ShowTime({
    super.key,
  });

  @override
  State<ShowTime> createState() => _ShowTimeState();
}

class _ShowTimeState extends State<ShowTime> {
  bool isHover = false;

  late DateTime date = DateTime.now();

  String currentTime = DateFormat('dd/MM').format(DateTime(
      DateTime.now().year, DateTime.now().month, DateTime.now().day - 1));
  List dateList = [
    DateFormat('dd/MM').format(DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day)),
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

  // String getLetterOfDay(String dateConvert) {
  //   if ("${DateFormat('EEEE').format(DateTime.parse(dateConvert))}" ==
  //       "Monday") {
  //     return 'Thứ 2';
  //   }
  //   if ("${DateFormat('EEEE').format(DateTime.parse(dateConvert))}" ==
  //       "Tuesday") {
  //     return 'Thứ 3';
  //   }
  //   if ("${DateFormat('EEEE').format(DateTime.parse(dateConvert))}" ==
  //       "Wednesday") {
  //     // dateName = "F";
  //     return 'Thứ 4';
  //   }
  //   if ("${DateFormat('EEEE').format(DateTime.parse(dateConvert))}" ==
  //       "Thursday") {
  //     // dateName = "W";
  //     return 'Thứ 5';
  //   }
  //   if ("${DateFormat('EEEE').format(DateTime.parse(dateConvert))}" ==
  //       "Friday") {
  //     // dateName = "T";
  //     return 'Thứ 6';
  //   }
  //   if ("${DateFormat('EEEE').format(DateTime.parse(dateConvert))}" ==
  //       "Saturday") {
  //     // dateName = "S";
  //     return 'Thứ 7';
  //   }
  //   return 'Chủ nhật';
  // }

  int itemChosed = 0;
  @override
  void initState() {
    super.initState();
    print(currentTime);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 24,
              width: 24,
              child: Icon(
                Iconsax.calendar,
                size: 24,
                color: AppColors.alt700,
              ),
            ),
            const SizedBox(width: 8),
            Container(
              alignment: Alignment.center,
              child: const Text(
                'Lịch chiếu',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    color: AppColors.alt700),
              ),
            )
          ],
        ),
        const SizedBox(height: 24),
        Container(
          width: 648,
          height: 84,
          child: ListView.builder(
              itemCount: dateList.length,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
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
                                picked: (itemChosed == index) ? true : false)),
                          )
                        : ((index == 0)
                            ? Center(
                                child: (ItemDateHead(
                                    date: dateList[index],
                                    dayName: 'Thứ 3',
                                    picked:
                                        (itemChosed == index) ? true : false)),
                              )
                            : Center(
                                child: (ItemDate(
                                    date: dateList[index],
                                    dayName: 'Thứ 3',
                                    picked:
                                        (itemChosed == index) ? true : false)),
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
        const FilmCard(),
      ],
    );
  }
}
