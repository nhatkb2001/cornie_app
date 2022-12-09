import 'package:cornie_app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ScheduleFilmCard extends StatefulWidget {
  const ScheduleFilmCard(
      {super.key,
      required this.hour,
      required this.price,
      required this.state,
      required this.picked});

  final String hour;
  final String price;
  final bool picked;
  final String state;

  @override
  State<ScheduleFilmCard> createState() => _ScheduleFilmCardState();
}

class _ScheduleFilmCardState extends State<ScheduleFilmCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 88,
      width: 72,
      margin: const EdgeInsets.only(left: 8),
      decoration: BoxDecoration(
          color: AppColors.white,
          border: Border.all(color: AppColors.grey900),
          borderRadius: BorderRadius.all(Radius.circular(8))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(widget.hour,
              style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  color: (widget.picked == false)
                      ? const Color(0xFF3B3B3B)
                      : AppColors.white)),
          const SizedBox(height: 8),
          Text(widget.price,
              style: const TextStyle(
                  fontSize: 12,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  color: AppColors.grey900)),
          const SizedBox(height: 8),
          const Icon(
            Iconsax.play,
            size: 24,
            color: AppColors.orange,
          )
        ],
      ),
    );
  }
}
