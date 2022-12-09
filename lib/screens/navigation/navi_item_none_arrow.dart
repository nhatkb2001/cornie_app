import 'package:cornie_app/constants/colors.dart';
import 'package:cornie_app/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class NaviItemNoneArrow extends StatefulWidget {
  late String title;
  late List items;

  NaviItemNoneArrow({super.key, required this.title, required this.items});

  @override
  State<NaviItemNoneArrow> createState() => _NaviItemNoneArrowState();
}

class _NaviItemNoneArrowState extends State<NaviItemNoneArrow> {
  String valueChoose = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 108,
      child: Center(
        child: Text(
          widget.title,
          style: const TextStyle(
              fontSize: 16,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              color: AppColors.black),
        ),
      ),
    );
  }
}
