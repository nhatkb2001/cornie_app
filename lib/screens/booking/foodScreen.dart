import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cornie_app/constants/colors.dart';
import 'package:cornie_app/screens/booking/components/buildChair.dart';
import 'package:cornie_app/screens/detail/components/heroSection/heroSection.dart';
import 'package:cornie_app/screens/detail/tabSection.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:iconsax/iconsax.dart';

import '../../models/scheduleModel.dart';

class FoodScreen extends StatefulWidget {
  FoodScreen({super.key});

  @override
  State<FoodScreen> createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {
  int price = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          color: AppColors.grey100,
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(bottom: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 48,
                  color: AppColors.white,
                  padding: EdgeInsets.only(left: 300, right: 300),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 32,
                        width: 32,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColors.grey700,
                            ),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8))),
                        child: const Center(
                          child: Icon(
                            Iconsax.category,
                            size: 24,
                            color: AppColors.grey700,
                          ),
                        ),
                      ),
                      SizedBox(width: 16),
                      const Center(
                        child: Icon(
                          Iconsax.arrow_right_2,
                          size: 24,
                          color: AppColors.black,
                        ),
                      ),
                      SizedBox(width: 16),
                      Container(
                        height: 32,
                        width: 32,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColors.error,
                            ),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8))),
                        child: const Center(
                          child: Icon(
                            Iconsax.shopping_cart,
                            size: 24,
                            color: AppColors.error,
                          ),
                        ),
                      ),
                      SizedBox(width: 16),
                      const Center(
                        child: Icon(
                          Iconsax.arrow_right_2,
                          size: 24,
                          color: AppColors.grey700,
                        ),
                      ),
                      SizedBox(width: 16),
                      Container(
                        height: 32,
                        width: 32,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColors.black,
                            ),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8))),
                        child: const Center(
                          child: Icon(
                            Iconsax.card_edit,
                            size: 24,
                            color: AppColors.black,
                          ),
                        ),
                      ),
                      SizedBox(width: 16),
                      const Center(
                        child: Icon(
                          Iconsax.arrow_right_2,
                          size: 24,
                          color: AppColors.grey700,
                        ),
                      ),
                      SizedBox(width: 16),
                      Container(
                        height: 32,
                        width: 32,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColors.black,
                            ),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8))),
                        child: const Center(
                          child: Icon(
                            Iconsax.info_circle,
                            size: 24,
                            color: AppColors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 60),
                Container(
                  padding: EdgeInsets.only(left: 250),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Container(
                            width: 300 + 56,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6.0),
                              color: AppColors.white,
                            ),
                            padding: EdgeInsets.only(
                                top: 14, bottom: 14, left: 14, right: 14),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Xác Ướp: Cuộc Phiêu Lưu Đến London [LT]',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.black,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'Rạp: ' + 'Cinestar Quốc Thanh',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.grey700,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'Suất 17:55 - Hôm nay, 29/01',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.grey700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 24),
                          Container(
                            width: 300 + 56,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6.0),
                              color: AppColors.white,
                            ),
                            padding: EdgeInsets.only(
                                top: 14, bottom: 14, left: 14, right: 14),
                            child: Column(
                              children: [
                                Text(
                                  'TỔNG ĐƠN HÀNG',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.black,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  price.toString() + " K",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 24),
                          Container(
                            width: 300 + 56,
                            height: 48,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6.0),
                              color: AppColors.grey900,
                            ),
                            child: Center(
                              child: Text(
                                "Tiếp tục",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.white,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}

class MatrixHelper {
  // Creates a map that can be stored in Firebase from an int matrix.
  static Map<String, dynamic> mapFromIntMatrix(List<List<int>> intMatrix) {
    Map<String, Map<String, dynamic>> map = {};
    int index = 0;
    for (List<int> row in intMatrix) {
      map.addEntries([MapEntry(index.toString(), {})]);
      int i = 0;
      for (int value in row) {
        map[index.toString()]
            ?.addEntries([MapEntry(i.toString(), value.toString())]);
        i += 1;
      }
      index += 1;
    }
    return map;
  }

  // Creates an int matrix from a dynamic map.
  static List<List<int>> intMatrixFromMap(Map<dynamic, dynamic> dynamicMap) {
    final map = Map<String, dynamic>.from(dynamicMap);
    List<List<int>> matrix = [];
    map.forEach((stringIndex, value) {
      Map<String, dynamic> rowMap = Map<String, dynamic>.from(value);
      List<int> row = [];
      rowMap.forEach((stringNumber, boolean) {
        row.add(int.parse(boolean));
      });
      matrix.add(row);
    });
    return matrix;
  }
}