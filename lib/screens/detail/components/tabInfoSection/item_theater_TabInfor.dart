import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cornie_app/constants/colors.dart';
import 'package:cornie_app/models/theaterDetail.dart';
import 'package:flutter/material.dart';

import '../../../dashboard/components/showtime_section/film/schedule_film_card.dart';

class item_theater_Tab_Infor extends StatefulWidget {
  item_theater_Tab_Infor(
      {super.key,
      required this.theater,
      required this.picked,
      required this.description});
  String theater;
  String description;
  bool picked;

  @override
  State<item_theater_Tab_Infor> createState() => _item_theater_Tab_InforState();
}

class _item_theater_Tab_InforState extends State<item_theater_Tab_Infor> {
  bool isHover = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 84,
          width: 776 - 24,
          decoration: BoxDecoration(
            color: (isHover = false)
                ? AppColors.grey200
                : ((widget.picked == true)
                    ? AppColors.alt700
                    : AppColors.white),
            // borderRadius: const BorderRadius.only(
            //     topLeft: Radius.circular(8), topRight: Radius.circular(8))
          ),
          child: Container(
            margin: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(widget.theater,
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          color: (widget.picked == false)
                              ? const Color(0xFF3B3B3B)
                              : AppColors.grey100)),
                ),
                const SizedBox(height: 8),
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(widget.description,
                      style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          color: (widget.picked == false)
                              ? const Color(0xFF3B3B3B)
                              : AppColors.grey100)),
                ),
              ],
            ),
          ),
        ),
        widget.picked
            ? Container(
                margin: EdgeInsets.only(top: 16),
                child: SizedBox(
                  height: 88,
                  child: ListView.builder(
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return const ScheduleFilmCard(
                          hour: '18.00',
                          picked: false,
                          price: '45' + 'K',
                          state: 'Play',
                        );
                      }),
                ),
              )
            : Container()
      ],
    );
  }
}
