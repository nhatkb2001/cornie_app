import 'package:cornie_app/constants/colors.dart';
import 'package:flutter/material.dart';

showRequestSignInDialog(BuildContext mContext) {
  return showDialog(
      context: mContext,
      builder: (context) {
        return StatefulBuilder(
            builder: (BuildContext mcontext, StateSetter setState) {
          return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              backgroundColor: AppColors.white,
              content: Container(
                padding:
                    EdgeInsets.only(top: 14, bottom: 14, right: 24, left: 24),
                alignment: Alignment.center,
                child: Text(
                  'Hãy đăng nhập để sử dụng dịch vụ ứng dụng',
                  style: const TextStyle(
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      color: AppColors.grey900),
                ),
              ));
        });
      });
}
