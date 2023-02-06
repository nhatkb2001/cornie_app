import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cornie_app/models/movieModel.dart';
import 'package:cornie_app/models/scheduleModel.dart';
import 'package:cornie_app/models/theaterDetail.dart';
import 'package:cornie_app/screens/dashboard/components/showtime_section/movie_notation/notation.dart';
import 'package:cornie_app/screens/dashboard/components/showtime_section/schedule/dateCard.dart';
import 'package:cornie_app/screens/dashboard/components/showtime_section/schedule/dateCardHead.dart';
import 'package:cornie_app/screens/dashboard/components/showtime_section/schedule/dialogShowTime.dart';
import 'package:cornie_app/screens/dashboard/components/theater_section/item_theater_end.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../constants/colors.dart';
import '../../../../models/theaterModel.dart';
import '../showtime_section/schedule/dateCardEnd.dart';
import 'item_theater.dart';

class ItemTheaterCard extends StatefulWidget {
  ItemTheaterCard(
      {super.key,
      required this.theater,
      required this.city,
      required this.userId});
  late TheaterModel theater;
  late String city;
  String userId;

  @override
  State<ItemTheaterCard> createState() => _ItemTheaterCardState();
}

class _ItemTheaterCardState extends State<ItemTheaterCard> {
  int itemChosed = 0;

  List<TheaterDetailModel> theaterDetailList = [];
  List<TheaterDetailModel> theaterDetailListFilter = [];
  Future getTheaterDetailList() async {
    FirebaseFirestore.instance
        .collection("theaters")
        .doc(widget.theater.id)
        .collection('theatersDetail')
        .snapshots()
        .listen((value) {
      setState(() {
        theaterDetailList.clear();
        theaterDetailListFilter.clear();
        value.docs.forEach((element) {
          theaterDetailList
              .add(TheaterDetailModel.fromDocument(element.data()));
        });
        for (var element in theaterDetailList) {
          if (element.city == widget.city) {
            theaterDetailListFilter.add(element);
          }
        }
      });
    });
  }

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
  String id = '';
  List<MovieModel> moviesList = [];
  List<ScheduleModel> scheduleList = [];
  List<ScheduleModel> scheduleListChoice = [];
  Future getScheduleList(String idTheaterDetail, context) async {
    FirebaseFirestore.instance
        .collection("schedules")
        .where('idTheaterDetail', isEqualTo: idTheaterDetail)
        .snapshots()
        .listen((value) {
      setState(() {
        scheduleList.clear();
        value.docs.forEach((element) {
          scheduleList.add(ScheduleModel.fromDocument(element.data()));
        });
        scheduleList.forEach((value3) {
          FirebaseFirestore.instance
              .collection("movies")
              .snapshots()
              .listen((value2) {
            setState(() {
              moviesList.clear();
              scheduleListChoice.clear();
              value2.docs.forEach((element2) {
                if (element2.id == value3.idMovie) {
                  moviesList.add(MovieModel.fromDocument(element2.data()));
                }
              });
              moviesList.forEach(
                (element) {
                  if (element.id == value3.idMovie) {
                    scheduleListChoice.add(value3);
                  }
                },
              );
              showTimeDialog(
                  context, scheduleListChoice, moviesList, widget.userId);
            });
          });
        });
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getTheaterDetailList();
    id = '';
  }

  @override
  Widget build(BuildContext context) {
    getTheaterDetailList();
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 24),
          child: Column(
            children: [
              Container(
                height: 52,
                width: 312,
                decoration: const BoxDecoration(
                    color: AppColors.alt100,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8))),
                child: Container(
                  margin: const EdgeInsets.only(left: 16, top: 16, bottom: 16),
                  child: Row(
                    children: [
                      Container(
                        height: 24,
                        width: 24,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(widget.theater.icon),
                              fit: BoxFit.contain),
                          shape: BoxShape.rectangle,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        widget.theater.name,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                            fontSize: 18,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            color: AppColors.grey900),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 312,
                child: ListView.builder(
                    itemCount: theaterDetailListFilter.length,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return (index == (theaterDetailListFilter.length - 1))
                          ? InkWell(
                              onTap: () {
                                setState(() {
                                  if (id == theaterDetailListFilter[index].id) {
                                    id = '';
                                  } else {
                                    id = theaterDetailListFilter[index].id;
                                    getScheduleList(
                                        theaterDetailListFilter[index].id,
                                        context);
                                  }
                                });
                              },
                              child: item_theater_end(
                                  theater: theaterDetailListFilter[index].name,
                                  description:
                                      theaterDetailListFilter[index].address,
                                  picked:
                                      (id == theaterDetailListFilter[index].id)
                                          ? true
                                          : false),
                            )
                          : InkWell(
                              onTap: () {
                                setState(() {
                                  if (id == theaterDetailListFilter[index].id) {
                                    id = '';
                                  } else {
                                    id = theaterDetailListFilter[index].id;
                                    getScheduleList(
                                        theaterDetailListFilter[index].id,
                                        context);
                                  }
                                });
                              },
                              child: item_theater(
                                  theater: theaterDetailListFilter[index].name,
                                  description:
                                      theaterDetailListFilter[index].address,
                                  picked:
                                      (id == theaterDetailListFilter[index].id)
                                          ? true
                                          : false),
                            );
                    }),
              )
            ],
          ),
        ),
      ],
    );
  }
}
