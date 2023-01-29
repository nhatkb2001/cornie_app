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
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 88,
      width: 72,
      margin: const EdgeInsets.only(left: 8),
      decoration: BoxDecoration(
          color:
              (widget.state == 'Played') ? AppColors.grey200 : AppColors.white,
          border: Border.all(
              color: (widget.state == 'Played')
                  ? AppColors.grey100
                  : ((widget.state == 'Play')
                      ? AppColors.green
                      : AppColors.grey900)),
          borderRadius: BorderRadius.all(Radius.circular(8))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(widget.hour,
              style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  color: (widget.state == 'Played')
                      ? AppColors.grey500
                      : ((widget.picked == false)
                          ? const Color(0xFF3B3B3B)
                          : AppColors.white))),
          const SizedBox(height: 8),
          Text(widget.price,
              style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  color: (widget.state == 'Played')
                      ? AppColors.grey500
                      : (AppColors.grey900))),
          const SizedBox(height: 8),
          (widget.state == 'Playing')
              ? Container(
                  height: 32,
                  width: 32,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.success,
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(8))),
                  child: const Center(
                    child: Icon(
                      Iconsax.play_circle,
                      size: 24,
                      color: AppColors.success,
                    ),
                  ),
                )
              : (widget.state == 'Play')
                  ? Icon(
                      Iconsax.play_circle,
                      size: 24,
                      color: AppColors.green,
                    )
                  : Container(
                      height: 24,
                      width: 24,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.grey500,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8))),
                      child: const Center(
                        child: Icon(
                          Iconsax.stop,
                          size: 16,
                          color: AppColors.grey500,
                        ),
                      ),
                    ),
        ],
      ),
    );
  }
}
