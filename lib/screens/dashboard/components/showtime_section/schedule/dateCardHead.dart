import 'package:cornie_app/constants/colors.dart';
import 'package:flutter/material.dart';

class ItemDateHead extends StatefulWidget {
  const ItemDateHead(
      {super.key,
      required this.date,
      required this.dayName,
      required this.picked});

  final String date;
  final String dayName;
  final bool picked;

  @override
  State<ItemDateHead> createState() => _ItemDateHeadState();
}

class _ItemDateHeadState extends State<ItemDateHead> {
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
            bottomLeft: Radius.circular(8),
            topLeft: Radius.circular(8),
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
