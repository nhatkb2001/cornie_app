import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cornie_app/constants/colors.dart';
import 'package:cornie_app/models/theaterDetail.dart';
import 'package:flutter/material.dart';

class item_theater extends StatefulWidget {
  item_theater(
      {super.key,
      required this.theater,
      required this.picked,
      required this.description});
  String theater;
  String description;
  bool picked;

  @override
  State<item_theater> createState() => _item_theaterState();
}

class _item_theaterState extends State<item_theater> {
  bool isHover = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 84,
      width: 312,
      decoration: BoxDecoration(
        color: (isHover = false)
            ? AppColors.grey200
            : ((widget.picked == true) ? AppColors.alt700 : AppColors.white),
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
                          : AppColors.white)),
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
                          : AppColors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
