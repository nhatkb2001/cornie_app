import 'package:cornie_app/constants/colors.dart';
import 'package:flutter/material.dart';

class item_theater_end extends StatefulWidget {
  const item_theater_end(
      {super.key,
      required this.theater,
      required this.description,
      required this.picked});

  final String theater;
  final String description;
  final bool picked;

  @override
  State<item_theater_end> createState() => _item_theater_endState();
}

class _item_theater_endState extends State<item_theater_end> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 84,
      width: 312,
      decoration: BoxDecoration(
          color: (isHover = false)
              ? AppColors.grey200
              : ((widget.picked == true) ? AppColors.alt700 : AppColors.white),
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8))),
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
            Text(widget.description,
                style: TextStyle(
                    fontSize: 12,
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
