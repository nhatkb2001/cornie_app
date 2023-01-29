import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cornie_app/models/newModel.dart';
import 'package:cornie_app/screens/detail/components/tabInfoSection/itemTheaterCardTabInfor.dart';
import 'package:cornie_app/screens/new/newItemEnd.dart';
import 'package:cornie_app/screens/rating/rateItem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

import '../../../../constants/colors.dart';
import '../../../../models/theaterModel.dart';
import '../../../dashboard/components/theater_section/item_theater_card.dart';
import '../../../new/newItem.dart';

class TabInfor extends StatefulWidget {
  const TabInfor({super.key});

  @override
  State<TabInfor> createState() => _TabInforState();
}

class _TabInforState extends State<TabInfor> {
  static String? convertUrlToId(String url, {bool trimWhitespaces = true}) {
    if (!url.contains("http") && (url.length == 11)) return url;
    if (trimWhitespaces) url = url.trim();

    for (var exp in [
      RegExp(
          r"^https:\/\/(?:www\.|m\.)?youtube\.com\/watch\?v=([_\-a-zA-Z0-9]{11}).*$"),
      RegExp(
          r"^https:\/\/(?:www\.|m\.)?youtube(?:-nocookie)?\.com\/embed\/([_\-a-zA-Z0-9]{11}).*$"),
      RegExp(r"^https:\/\/youtu\.be\/([_\-a-zA-Z0-9]{11}).*$")
    ]) {
      Match? match = exp.firstMatch(url);
      if (match != null && match.groupCount >= 1) return match.group(1);
    }
    return null;
  }

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

  late YoutubePlayerController _controller;
  Future initializePlayer() async {
    _controller = YoutubePlayerController.fromVideoId(
      params: const YoutubePlayerParams(
        showControls: true,
        mute: false,
        showFullscreenButton: true,
        loop: false,
      ),
      videoId: convertUrlToId("https://www.youtube.com/watch?v=-hJWNccNm78")
          .toString(),
    );
  }

  bool show = false;

  String city = 'Tp. Hồ Chí Minh';
  final List<String> address = <String>[
    'Tp. Hồ Chí Minh',
    'Đồng Nai',
    'Bình Dương',
    'Long An',
    'Tiền Giang',
    'Bà Rịa-Vũng Tàu',
    'Kiên Giang',
    'Bình Định',
    'Lâm Đồng',
    'Thừa Thiên Huế',
    'Đà Nẵng',
    'Gia Lai',
    'Khánh Hòa',
    'Kon Tum'
  ];

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    initializePlayer();
    getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.grey100,
      child: Container(
        margin: EdgeInsets.only(left: 60),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 24,
              ),
              const Text(
                'Trailer',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    color: AppColors.grey900),
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                height: 450,
                width: 800,
                child: YoutubePlayerControllerProvider(
                  controller: _controller,
                  child: YoutubePlayer(
                    aspectRatio: 16 / 9,
                    controller: _controller,
                  ),
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Container(
                  width: 800,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  padding: EdgeInsets.only(left: 24, right: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 24),
                      const Text(
                        'Lịch chiếu',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            color: AppColors.grey900),
                      ),
                      SizedBox(height: 8),
                      const Text(
                        'Chọn khu vực bạn muốn xem lịch chiếu cho phim',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            color: AppColors.grey700),
                      ),
                      SizedBox(height: 16),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 40,
                            width: 560 - 48 * 2 + 24,
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColors.grey700),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                            ),
                            child: DropdownButton(
                              items: address.map((valueItem) {
                                return DropdownMenuItem(
                                  value: valueItem,
                                  child: Text(
                                    valueItem,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.black),
                                  ),
                                );
                              }).toList(),
                              underline: const SizedBox(),
                              onChanged: ((value) {
                                setState(() {
                                  city = value!;
                                  show = false;
                                });
                              }),
                              hint: Container(
                                margin: EdgeInsets.only(left: 12, top: 6),
                                child: Text(
                                  city,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.black),
                                ),
                              ),
                              iconSize: 24,
                              isExpanded: true,
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                            ),
                          ),
                          Spacer(),
                          Container(
                            width: 240,
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              color: AppColors.grey900,
                            ),
                            child: ElevatedButton(
                              //action navigate to dashboard screen
                              onPressed: () async {
                                setState(() {
                                  getTheaterList();
                                  show = !show;
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                  shadowColor:
                                      AppColors.white.withOpacity(0.25),
                                  elevation: 15,
                                  animationDuration:
                                      const Duration(milliseconds: 300),
                                  minimumSize: Size(327 + 24, 44),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0)),
                                  textStyle: const TextStyle(
                                      color: AppColors.white,
                                      fontFamily: 'Propins',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18)),
                              child: Container(
                                alignment: Alignment.center,
                                child: const Text(
                                  'Xem lịch chiếu',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: 'Propins',
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      show
                          ? Column(
                              children: [
                                SizedBox(height: 24),
                                SizedBox(
                                    width: 312 + 464,
                                    child: ListView.builder(
                                        itemCount: theaterListFilter.length,
                                        scrollDirection: Axis.vertical,
                                        shrinkWrap: true,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return (theaterListFilter.isNotEmpty)
                                              ? ItemTheaterCardTabInfor(
                                                  theater:
                                                      theaterListFilter[index],
                                                  city: city)
                                              : Container();
                                        })),
                              ],
                            )
                          : Container(),
                      SizedBox(height: 24),
                    ],
                  )),
              SizedBox(
                height: 24,
              ),
              Column(
                children: [
                  Container(
                    width: 800,
                    height: 40,
                    padding: EdgeInsets.only(left: 24),
                    decoration: BoxDecoration(
                      color: AppColors.grey200,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8)),
                    ),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        'Bài viết liên quan',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Propins',
                          fontWeight: FontWeight.w600,
                          color: AppColors.grey900,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                      width: 800,
                      child: ListView.builder(
                          itemCount: listNew.length,
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            return (index != (3 - 1))
                                ? NewItem(id: listNew[index].id)
                                : NewItemEnd(id: listNew[index].id);
                          })),
                ],
              ),
              SizedBox(
                height: 24,
              ),
              Column(
                children: [
                  Container(
                    width: 800,
                    height: 40,
                    padding: EdgeInsets.only(left: 24),
                    decoration: BoxDecoration(
                      color: AppColors.grey200,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8)),
                    ),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        'Cộng đồng',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Propins',
                          fontWeight: FontWeight.w600,
                          color: AppColors.grey900,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                      width: 800,
                      child: ListView.builder(
                          itemCount: 3,
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            return RatingItem();
                          })),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
