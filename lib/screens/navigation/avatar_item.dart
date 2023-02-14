import 'package:cornie_app/constants/colors.dart';
import 'package:cornie_app/controller/authenController.dart';
import 'package:flutter/material.dart';

import 'navigation_ticketList.dart';

showProfileDialog(BuildContext mContext, String userId) {
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
                  height: 250,
                  padding:
                      EdgeInsets.only(top: 14, bottom: 14, right: 24, left: 24),
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Container(
                        width: 327 + 24,
                        height: 44,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          color: AppColors.grey900,
                        ),
                        child: ElevatedButton(
                          //action navigate to dashboard screen
                          onPressed: () async {
                            signOut(context);
                          },
                          style: ElevatedButton.styleFrom(
                              primary: AppColors.grey900,
                              onPrimary: Colors.white,
                              shadowColor: AppColors.grey900.withOpacity(0.25),
                              elevation: 15,
                              animationDuration: Duration(milliseconds: 300),
                              // maximumSize: Size.fromWidth(200),
                              minimumSize: const Size(327 + 24, 44),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16.0)),
                              // BorderRadius.all(Radius.circular(16)),
                              textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18)),
                          child: Container(
                            alignment: Alignment.center,
                            child: const Text(
                              'Đăng xuất',
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'Urbanist',
                                fontWeight: FontWeight.w600,
                                color: AppColors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 24),
                        width: 327 + 24,
                        height: 44,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          color: AppColors.grey900,
                        ),
                        child: ElevatedButton(
                          //action navigate to dashboard screen
                          onPressed: () async {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => NavigationTicket(
                                          uid: userId,
                                        )));
                          },
                          style: ElevatedButton.styleFrom(
                              primary: AppColors.grey900,
                              onPrimary: Colors.white,
                              shadowColor: AppColors.grey900.withOpacity(0.25),
                              elevation: 15,
                              animationDuration: Duration(milliseconds: 300),
                              // maximumSize: Size.fromWidth(200),
                              minimumSize: const Size(327 + 24, 44),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16.0)),
                              // BorderRadius.all(Radius.circular(16)),
                              textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18)),
                          child: Container(
                            alignment: Alignment.center,
                            child: const Text(
                              'Danh sách vé đặt',
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'Urbanist',
                                fontWeight: FontWeight.w600,
                                color: AppColors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 24),
                        width: 327 + 24,
                        height: 44,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          color: AppColors.grey900,
                        ),
                        child: ElevatedButton(
                          //action navigate to dashboard screen
                          onPressed: () async {},
                          style: ElevatedButton.styleFrom(
                              primary: AppColors.grey900,
                              onPrimary: Colors.white,
                              shadowColor: AppColors.grey900.withOpacity(0.25),
                              elevation: 15,
                              animationDuration: Duration(milliseconds: 300),
                              // maximumSize: Size.fromWidth(200),
                              minimumSize: const Size(327 + 24, 44),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16.0)),
                              // BorderRadius.all(Radius.circular(16)),
                              textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18)),
                          child: Container(
                            alignment: Alignment.center,
                            child: const Text(
                              'Danh sách phim yêu thích',
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'Urbanist',
                                fontWeight: FontWeight.w600,
                                color: AppColors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )));
        });
      });
}
