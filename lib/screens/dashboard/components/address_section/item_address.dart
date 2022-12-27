import 'package:cornie_app/constants/colors.dart';
import 'package:flutter/material.dart';

class item_address extends StatefulWidget {
  const item_address(
      {super.key,
      required this.address,
      required this.numberTheater,
      required this.picked});

  final String address;
  final String numberTheater;
  final bool picked;

  @override
  State<item_address> createState() => _item_addressState();
}

class _item_addressState extends State<item_address> {
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
          border: const Border(
              bottom: BorderSide(width: 1, color: AppColors.grey200))),
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
        ],
      ),
    );
  }
}
