import 'package:cornie_app/constants/colors.dart';
import 'package:flutter/material.dart';

class ItemDateEnd extends StatefulWidget {
  const ItemDateEnd(
      {super.key,
      required this.date,
      required this.dayName,
      required this.picked});

  final String date;
  final String dayName;
  final bool picked;

  @override
  State<ItemDateEnd> createState() => _ItemDateEndState();
}

class _ItemDateEndState extends State<ItemDateEnd> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 84,
      width: 92.57,
      decoration: BoxDecoration(
          color: (isHover = false)
              ? AppColors.grey200
              : ((widget.picked == true) ? AppColors.alt700 : AppColors.white),
          borderRadius: const BorderRadius.only(
            bottomRight: Radius.circular(8),
            topRight: Radius.circular(8),
          )),
      child: Container(
        margin: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(widget.date,
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    color: (widget.picked == false)
                        ? const Color(0xFF3B3B3B)
                        : AppColors.white)),
          ],
        ),
      ),
    );
  }
}
