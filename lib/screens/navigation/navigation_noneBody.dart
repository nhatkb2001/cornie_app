import 'package:cornie_app/constants/colors.dart';
import 'package:cornie_app/constants/images.dart';
import 'package:cornie_app/screens/dashboard/components/address_section/address_list.dart';
import 'package:cornie_app/screens/dashboard/dashboard.dart';
import 'package:cornie_app/screens/navigation/navi_item.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../navigation/navi_item_none_arrow.dart';

class NavigationNoneBody extends StatefulWidget {
  const NavigationNoneBody({super.key});

  @override
  State<NavigationNoneBody> createState() => _NavigationNoneBodyState();
}

class _NavigationNoneBodyState extends State<NavigationNoneBody> {
  int valueChoose = 1;
  PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      backgroundColor: AppColors.white,
      actions: <Widget>[
        GestureDetector(
          onTap: () {
            setState(() {
              controller.jumpToPage(0);
              print('okey');
            });
          },
          child: Container(
            margin: EdgeInsets.only(right: 16),
            child: NaviItemNoneArrow(
              items: ['Đặt vé', 'Mua vé online'],
              title: 'Mua vé',
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(right: 16),
          child: NaviItem(
            items: ['Lịch Chiếu', 'Đang Chiếu', 'Sắp Chiếu', 'Chiếu Sớm'],
            title: 'Phim',
          ),
        ),
        Container(
          margin: EdgeInsets.only(right: 16),
          child: NaviItem(
            items: ['Đặt vé', 'Mua vé online'],
            title: 'Rạp',
          ),
        ),
        Container(
          margin: EdgeInsets.only(right: 16),
          child: NaviItem(
            items: ['Tin Điện Ảnh', 'Video'],
            title: 'Tin tức',
          ),
        ),
        Container(
          margin: EdgeInsets.only(right: 16),
          child: NaviItemNoneArrow(
            items: ['Tin Điện Ảnh', 'Video'],
            title: 'Đánh giá',
          ),
        ),
        Container(
          margin: EdgeInsets.only(right: 400),
          child: NaviItemNoneArrow(
            items: ['Tin Điện Ảnh', 'Video'],
            title: 'Cộng đồng',
          ),
        )
      ],
    ));
  }
}
