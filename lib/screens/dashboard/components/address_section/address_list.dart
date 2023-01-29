import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cornie_app/constants/colors.dart';
import 'package:cornie_app/constants/images.dart';
import 'package:cornie_app/models/theaterDetail.dart';
import 'package:cornie_app/models/theaterModel.dart';
import 'package:cornie_app/screens/dashboard/components/address_section/item_address.dart';
import 'package:cornie_app/screens/dashboard/components/address_section/item_address_end.dart';
import 'package:cornie_app/screens/dashboard/components/theater_section/item_theater.dart';
import 'package:cornie_app/screens/dashboard/components/theater_section/item_theater_card.dart';
import 'package:cornie_app/screens/dashboard/components/theater_section/item_theater_end.dart';
import 'package:cornie_app/screens/navigation/navi_item.dart';
import 'package:cornie_app/screens/new/newDetail.dart';
import 'package:cornie_app/screens/new/newItem.dart';
import 'package:cornie_app/screens/new/newItemEnd.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../models/newModel.dart';
import '../showtime_section/showtime.dart';

class AddressList extends StatefulWidget {
  AddressList({
    super.key,
  });

  @override
  State<AddressList> createState() => _AddressListState();
}

class _AddressListState extends State<AddressList> {
  String city = 'Tp. Hồ Chí Minh';
  final List<String> addressSouth = <String>[
    'Tp. Hồ Chí Minh',
    'Đồng Nai',
    'Bình Dương',
    'Long An',
    'Tiền Giang',
    'Bà Rịa-Vũng Tàu',
    'Kiên Giang'
  ];
  final List<String> addressMid = <String>[
    'Bình Định',
    'Lâm Đồng',
    'Thừa Thiên Huế',
    'Đà Nẵng',
    'Gia Lai',
    'Khánh Hòa',
    'Kon Tum'
  ];
  final List<String> numberSouth = <String>['6', '4', '3', '3', '2', '2', '1'];
  final List<String> numberMid = <String>['1', '1', '1', '1', '1', '1', '1'];
  int itemChosed = -1;
  bool checked = false;
  bool reloaded = false;

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();
  List<TheaterModel> theaterList = [];
  List<TheaterModel> theaterListFilter = [];
  Future getTheaterList() async {
    FirebaseFirestore.instance
        .collection("theaters")
        .snapshots()
        .listen((value) {
      setState(() {
        theaterList.clear();
        theaterListFilter.clear();
        value.docs.forEach((element) {
          theaterList.add(TheaterModel.fromDocument(element.data()));
        });
        for (var element in theaterList) {
          if (element.cityList.contains(city)) {
            setState(() {
              theaterListFilter.add(element);
            });
          }
        }
      });
    });
  }

  String id = '';
  List<NewModel> listNew = [];

  Future getNews() async {
    FirebaseFirestore.instance.collection("news").snapshots().listen((value) {
      setState(() {
        listNew.clear();
        for (var element in value.docs) {
          listNew.add(NewModel.fromDocument(element.data()));
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getTheaterList();
    getNews();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      key: _refreshIndicatorKey,
      onRefresh: () {
        return Future<void>.delayed(const Duration(seconds: 3));
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 24,
                    width: 24,
                    child: Icon(
                      Iconsax.picture_frame,
                      size: 24,
                      color: AppColors.alt700,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    alignment: Alignment.center,
                    child: const Text(
                      'Khu Vực',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          color: AppColors.alt700),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 24),
              Container(
                height: 52,
                width: 312,
                decoration: const BoxDecoration(
                    color: AppColors.alt100,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8))),
                child: Container(
                  margin: const EdgeInsets.only(left: 16, top: 16, bottom: 16),
                  child: const Text(
                    'Miền Nam',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        color: AppColors.grey900),
                  ),
                ),
              ),
              Container(
                width: 312,
                child: ListView.builder(
                    itemCount: addressSouth.length,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            if (city == addressSouth[index]) {
                              city = '';
                            } else {
                              city = addressSouth[index];
                              getTheaterList();
                            }
                          });
                        },
                        child: item_address(
                            address: addressSouth[index],
                            numberTheater: numberSouth[index],
                            picked:
                                (city == addressSouth[index]) ? true : false),
                      );
                    }),
              ),
              Container(
                height: 52,
                width: 312,
                decoration: const BoxDecoration(
                  color: AppColors.alt100,
                ),
                child: Container(
                  margin: const EdgeInsets.only(left: 16, top: 16, bottom: 16),
                  child: const Text(
                    'Miền Trung',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        color: AppColors.grey900),
                  ),
                ),
              ),
              Container(
                width: 312,
                child: ListView.builder(
                    itemCount: addressMid.length,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return (index == (addressMid.length - 1))
                          ? InkWell(
                              onTap: () {
                                setState(() {
                                  if (city == addressMid[index]) {
                                    city = '';
                                    theaterList.clear();
                                  } else {
                                    city = addressMid[index];
                                    getTheaterList();
                                  }
                                });
                              },
                              child: item_address_end(
                                  address: addressMid[index],
                                  numberTheater: numberMid[index],
                                  picked: (city == addressMid[index])
                                      ? true
                                      : false),
                            )
                          : InkWell(
                              onTap: () {
                                setState(() {
                                  if (city == addressMid[index]) {
                                    city = '';
                                    theaterList.clear();
                                  } else {
                                    city = addressMid[index];
                                    getTheaterList();
                                  }
                                });
                              },
                              child: item_address(
                                  address: addressMid[index],
                                  numberTheater: numberMid[index],
                                  picked: (city == addressMid[index])
                                      ? true
                                      : false),
                            );
                    }),
              ),
            ],
          ),
          const SizedBox(width: 24),
          theaterList.length == 0
              ? Container()
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 24,
                              width: 24,
                              child: Icon(
                                Iconsax.picture_frame,
                                size: 24,
                                color: AppColors.alt700,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Container(
                              alignment: Alignment.center,
                              child: const Text(
                                'Rạp Phim',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.alt700),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        (theaterListFilter.length != 0)
                            ? SizedBox(
                                width: 312,
                                child: ListView.builder(
                                    itemCount: theaterListFilter.length,
                                    scrollDirection: Axis.vertical,
                                    shrinkWrap: true,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return ItemTheaterCard(
                                          theater: theaterListFilter[index],
                                          city: city);
                                    }))
                            : Container(
                                height: 52,
                                width: 312,
                                decoration: BoxDecoration(
                                  color: AppColors.orange,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                ),
                                child: Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Hiện chưa có rạp tại thành phố',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.black),
                                  ),
                                ),
                              ),
                      ],
                    ),
                  ],
                ),
          const SizedBox(width: 24),
          (listNew.length != 0)
              ? Column(
                  children: [
                    const SizedBox(height: 50),
                    Container(
                      height: 52,
                      width: 800,
                      decoration: const BoxDecoration(
                          color: AppColors.alt100,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(8))),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(
                                left: 16, top: 16, bottom: 16),
                            child: const Text(
                              'Hot News',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.grey900),
                            ),
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: () {
                              //Create news
                            },
                            child: Container(
                                margin: const EdgeInsets.only(right: 24),
                                child: const Icon(
                                  Iconsax.add_square,
                                  size: 28,
                                  color: AppColors.grey900,
                                )),
                          ),
                        ],
                      ),
                    ),
                    (listNew.isNotEmpty)
                        ? SizedBox(
                            width: 800,
                            child: ListView.builder(
                                itemCount: listNew.length,
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                itemBuilder: (BuildContext context, int index) {
                                  return ((index != (listNew.length - 1))
                                      ? GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        NewDetail(
                                                          id: listNew[index].id,
                                                        )));
                                          },
                                          child: NewItem(
                                            id: listNew[index].id,
                                          ))
                                      : GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        NewDetail(
                                                            id: listNew[index]
                                                                .id)));
                                          },
                                          child: NewItemEnd(
                                            id: listNew[index].id,
                                          )));
                                }))
                        : CircularProgressIndicator(
                            strokeWidth: 2,
                            color: AppColors.white,
                          )
                  ],
                )
              : CircularProgressIndicator(
                  strokeWidth: 2,
                  color: AppColors.white,
                )
        ],
      ),
    );
  }
}
