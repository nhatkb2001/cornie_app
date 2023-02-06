import 'package:cornie_app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class BuildChairs {
  static Widget selectedChair() {
    return Container(
      height: 20.0,
      width: 20.0,
      decoration: BoxDecoration(
          color: AppColors.green, borderRadius: BorderRadius.circular(6.0)),
    );
  }

  static Widget availableChair(String number) {
    return Container(
      height: 20.0,
      width: 20.0,
      decoration: BoxDecoration(
          color: AppColors.grey500, borderRadius: BorderRadius.circular(6.0)),
      child: Center(
        child: Text(
          number,
          style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 14,
              color: AppColors.white,
              fontWeight: FontWeight.w400),
        ),
      ),
    );
  }

  static Widget reservedChair() {
    return Container(
      height: 20,
      width: 20,
      decoration: BoxDecoration(
          color: AppColors.grey900,
          borderRadius: const BorderRadius.all(Radius.circular(6))),
    );
  }
}
