import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cornie_app/constants/colors.dart';
import 'package:cornie_app/controller/foodController.dart';
import 'package:cornie_app/models/comboModel.dart';
import 'package:cornie_app/screens/booking/components/buildChair.dart';
import 'package:cornie_app/screens/detail/components/heroSection/heroSection.dart';
import 'package:cornie_app/screens/detail/tabSection.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../models/scheduleModel.dart';
import '../../models/seatModel.dart';
import 'checkOutScreen.dart';

class FoodScreen extends StatefulWidget {
  int pricetotal;
  List<List<int>> chairStatus;
  List<SeatModel> seatList;
  String schedulesId;
  String userId;
  String nameMovie;
  String nametheater;
  String date;

  FoodScreen(
      {super.key,
      required this.pricetotal,
      required this.chairStatus,
      required this.schedulesId,
      required this.userId,
      required this.nameMovie,
      required this.nametheater,
      required this.date,
      required this.seatList});

  @override
  State<FoodScreen> createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {
  List<ComboModel> combo = [];
  List<ComboModel> combo_2 = [];
  List<ComboModel> comboCheckOut = [];
  ComboModel combo1 =
      ComboModel(name: 'Bắp Ngọt 60oz', price: '40', quantity: '0');
  ComboModel combo2 =
      ComboModel(name: 'Nấm Caramel 60oz', price: '44', quantity: '0');
  ComboModel combo3 =
      ComboModel(name: 'Bắp Phô Mai 60oz', price: '44', quantity: '0');
  ComboModel combo4 = ComboModel(
      name: '1 Bắp Ngọt 60oz + 1 Coke 22oz - V', price: '65', quantity: '0');
  ComboModel combo5 = ComboModel(
      name: '2 Coke 32oz + 1 Bắp Ngọt 60oz', price: '85', quantity: '0');
  ComboModel combo6 = ComboModel(
      name: '4 Coke 22oz + 2 Bắp Ngọt 60oz', price: '160', quantity: '0');
  List<String> item = [];
  List<String> item2 = [];
  ComboModel pro = ComboModel(name: '', price: '', quantity: '');
  @override
  void initState() {
    combo.add(combo1);
    item.add(combo1.quantity);
    combo.add(combo2);
    item.add(combo2.quantity);
    combo.add(combo3);
    item.add(combo3.quantity);
    combo_2.add(combo4);
    item2.add(combo4.quantity);
    combo_2.add(combo5);
    item2.add(combo5.quantity);
    combo_2.add(combo6);
    item2.add(combo6.quantity);
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
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
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
                            width: 800,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(6),
                                    topRight: Radius.circular(6)),
                                color: AppColors.grey100,
                                border: Border.all(color: AppColors.grey200)),
                            padding: EdgeInsets.only(
                                top: 14, bottom: 14, left: 14, right: 14),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "COMBO",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.grey500,
                                      ),
                                    ),
                                    Spacer(),
                                    Row(
                                      children: [
                                        Text(
                                          "GIÁ TIỀN",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w600,
                                            color: AppColors.grey500,
                                          ),
                                        ),
                                        SizedBox(width: 24),
                                        Text(
                                          "SỐ LƯỢNG",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w600,
                                            color: AppColors.grey500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Container(
                            width: 800,
                            decoration: BoxDecoration(
                              color: AppColors.grey200,
                            ),
                            padding: EdgeInsets.only(
                                top: 14, bottom: 14, left: 14, right: 14),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: Text(
                                    "BẮP RANG",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.grey700.withOpacity(0.5),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 800,
                            decoration: const BoxDecoration(
                              color: AppColors.white,
                            ),
                            child: ListView.builder(
                                itemCount: combo.length,
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                itemBuilder: (BuildContext context, int index) {
                                  return Container(
                                    width: 800,
                                    height: 72,
                                    padding: const EdgeInsets.only(
                                        left: 14, right: 14),
                                    decoration: BoxDecoration(
                                      border:
                                          Border.all(color: AppColors.grey100),
                                      color: AppColors.white,
                                    ),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          combo[index].name,
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.grey700,
                                          ),
                                        ),
                                        Spacer(),
                                        Row(
                                          children: [
                                            Text(
                                              combo[index].price.toString() +
                                                  " K",
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w600,
                                                color: AppColors.grey500,
                                              ),
                                            ),
                                            SizedBox(width: 48),
                                            Row(
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      if (int.parse(
                                                              item[index]) ==
                                                          0) {
                                                        item[index] = '0';
                                                      } else {
                                                        item[index] =
                                                            (int.parse(item[
                                                                        index]) -
                                                                    1)
                                                                .toString();
                                                        widget.pricetotal =
                                                            widget.pricetotal -
                                                                int.parse(
                                                                    combo[index]
                                                                        .price);
                                                      }
                                                    });
                                                  },
                                                  child: Container(
                                                    height: 24,
                                                    width: 24,
                                                    decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        border: Border.all(
                                                            color: AppColors
                                                                .grey200)),
                                                    child: Icon(Iconsax.minus,
                                                        size: 16,
                                                        color:
                                                            AppColors.grey500),
                                                  ),
                                                ),
                                                SizedBox(width: 8),
                                                Text(
                                                  int.parse(item[index])
                                                      .toString(),
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w600,
                                                    color: AppColors.grey500,
                                                  ),
                                                ),
                                                SizedBox(width: 8),
                                                GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      item[index] = (int.parse(
                                                                  item[index]) +
                                                              1)
                                                          .toString();
                                                      widget.pricetotal = widget
                                                              .pricetotal +
                                                          int.parse(combo[index]
                                                              .price);
                                                    });
                                                  },
                                                  child: Container(
                                                    height: 24,
                                                    width: 24,
                                                    decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        border: Border.all(
                                                            color: AppColors
                                                                .grey200)),
                                                    child: Icon(Iconsax.add,
                                                        size: 16,
                                                        color:
                                                            AppColors.grey500),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  );
                                }),
                          ),
                          Container(
                            width: 800,
                            decoration: BoxDecoration(
                              color: AppColors.grey200,
                            ),
                            padding: EdgeInsets.only(
                                top: 14, bottom: 14, left: 14, right: 14),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: Text(
                                    "COMBO - V1",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.grey700.withOpacity(0.5),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 800,
                            decoration: const BoxDecoration(
                              color: AppColors.white,
                            ),
                            child: ListView.builder(
                                itemCount: combo_2.length,
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                itemBuilder: (BuildContext context, int index) {
                                  return Container(
                                    width: 800,
                                    height: 72,
                                    padding: const EdgeInsets.only(
                                        left: 14, right: 14),
                                    decoration: BoxDecoration(
                                      border:
                                          Border.all(color: AppColors.grey100),
                                      color: AppColors.white,
                                    ),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          combo_2[index].name,
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.grey700,
                                          ),
                                        ),
                                        Spacer(),
                                        Row(
                                          children: [
                                            Text(
                                              combo_2[index].price.toString() +
                                                  " K",
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w600,
                                                color: AppColors.grey500,
                                              ),
                                            ),
                                            SizedBox(width: 48),
                                            Row(
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      if (int.parse(
                                                              item2[index]) ==
                                                          0) {
                                                        item2[index] = '0';
                                                      } else {
                                                        item2[index] =
                                                            (int.parse(item2[
                                                                        index]) -
                                                                    1)
                                                                .toString();
                                                        widget
                                                            .pricetotal = widget
                                                                .pricetotal -
                                                            int.parse(
                                                                combo_2[index]
                                                                    .price);
                                                      }
                                                    });
                                                  },
                                                  child: Container(
                                                    height: 24,
                                                    width: 24,
                                                    decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        border: Border.all(
                                                            color: AppColors
                                                                .grey200)),
                                                    child: Icon(Iconsax.minus,
                                                        size: 16,
                                                        color:
                                                            AppColors.grey500),
                                                  ),
                                                ),
                                                SizedBox(width: 8),
                                                Text(
                                                  int.parse(item2[index])
                                                      .toString(),
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w600,
                                                    color: AppColors.grey500,
                                                  ),
                                                ),
                                                SizedBox(width: 8),
                                                GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      item2[index] = (int.parse(
                                                                  item2[
                                                                      index]) +
                                                              1)
                                                          .toString();
                                                      widget.pricetotal =
                                                          widget.pricetotal +
                                                              int.parse(
                                                                  combo_2[index]
                                                                      .price);
                                                    });
                                                  },
                                                  child: Container(
                                                    height: 24,
                                                    width: 24,
                                                    decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        border: Border.all(
                                                            color: AppColors
                                                                .grey200)),
                                                    child: Icon(Iconsax.add,
                                                        size: 16,
                                                        color:
                                                            AppColors.grey500),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  );
                                }),
                          ),
                        ],
                      ),
                      SizedBox(width: 32),
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
                                  widget.nameMovie,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.black,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'Rạp: ' + widget.nametheater,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.grey700,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  widget.date,
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
                                  widget.pricetotal.toString() + " K",
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
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                comboCheckOut.clear();
                                for (var i = 0; i < item.length; i++) {
                                  if (item[i] != '0') {
                                    ComboModel cbm = ComboModel(
                                        name: combo[i].name,
                                        price: combo[i].price,
                                        quantity: item[i]);
                                    comboCheckOut.add(cbm);
                                  }
                                }
                                for (var i = 0; i < item2.length; i++) {
                                  if (item2[i] != '0') {
                                    ComboModel cbm2 = ComboModel(
                                        name: combo_2[i].name,
                                        price: combo_2[i].price,
                                        quantity: item2[i]);
                                    comboCheckOut.add(cbm2);
                                  }
                                }
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CheckOut(
                                              chairStatus: widget.chairStatus,
                                              comboCheckOut: comboCheckOut,
                                              seatList: widget.seatList,
                                              pricetotal: widget.pricetotal,
                                              scheduleId: widget.schedulesId,
                                              userId: widget.userId,
                                              date: widget.date,
                                              nameMovie: widget.nameMovie,
                                              nametheater: widget.nametheater,
                                            )));
                              });
                            },
                            child: Container(
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
