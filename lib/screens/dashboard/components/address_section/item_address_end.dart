import 'package:cornie_app/constants/colors.dart';
import 'package:flutter/material.dart';

class item_address_end extends StatefulWidget {
  const item_address_end(
      {super.key,
      required this.address,
      required this.numberTheater,
      required this.picked});

  final String address;
  final String numberTheater;
  final bool picked;

  @override
  State<item_address_end> createState() => _item_address_endState();
}

class _item_address_endState extends State<item_address_end> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      width: 312,
      decoration: BoxDecoration(
          color: (isHover = false)
              ? AppColors.grey200
              : ((widget.picked == true) ? AppColors.alt700 : AppColors.white),
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8))),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 16, top: 16, bottom: 16),
            child: Text(widget.address,
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    color: (widget.picked == false)
                        ? const Color(0xFF3B3B3B)
                        : AppColors.white)),
          ),
          const Spacer(),
          Container(
            margin: const EdgeInsets.only(right: 16, top: 16, bottom: 16),
            child: Container(
              height: 48,
              width: 48,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: (widget.picked == false)
                      ? AppColors.alt700
                      : AppColors.white),
              alignment: Alignment.center,
              child: Text(widget.numberTheater,
                  style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      color: (widget.picked == false)
                          ? AppColors.white
                          : AppColors.alt700)),
            ),
          ),
        ],
      ),
    );
  }
}
