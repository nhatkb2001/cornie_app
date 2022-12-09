import 'package:cornie_app/constants/colors.dart';
import 'package:flutter/material.dart';

class ItemDate extends StatefulWidget {
  const ItemDate(
      {super.key,
      required this.date,
      required this.dayName,
      required this.picked});

  final String date;
  final String dayName;
  final bool picked;

  @override
  State<ItemDate> createState() => _ItemDateState();
}

class _ItemDateState extends State<ItemDate> {
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
      ),
      child: Container(
        margin: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              child: Text(widget.date,
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      color: (widget.picked == false)
                          ? const Color(0xFF3B3B3B)
                          : AppColors.white)),
            ),
            const SizedBox(height: 8),
            Text(widget.dayName,
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
