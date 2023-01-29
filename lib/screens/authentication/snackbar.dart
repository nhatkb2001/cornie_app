import 'package:cornie_app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:iconsax/iconsax.dart';

void showSnackBar(context, text, category) {
  final snackBar = SnackBar(
    content: GestureDetector(
      onTap: () => ScaffoldMessenger.of(context)..hideCurrentSnackBar(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(width: 4),
          (category == 'success')
              ? Icon(Iconsax.tick_square, size: 24, color: AppColors.black)
              : ((category == 'error')
                  ? Icon(Iconsax.close_square, size: 24, color: AppColors.black)
                  : Icon(Iconsax.danger, size: 24, color: AppColors.black)),
          SizedBox(width: 16),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                  fontFamily: 'Urbanist',
                  color: AppColors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 12),
            ),
          ),
        ],
      ),
    ),
    backgroundColor: AppColors.white,
    duration: Duration(seconds: 3),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    margin: EdgeInsets.symmetric(horizontal: 24),
    behavior: SnackBarBehavior.floating,
    elevation: 10,
  );

  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(snackBar);
}
