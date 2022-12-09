import 'package:cornie_app/constants/colors.dart';
import 'package:cornie_app/constants/images.dart';
import 'package:cornie_app/screens/dashboard/components/address_section/address_list.dart';
import 'package:cornie_app/screens/navigation/navi_item.dart';
import 'package:cornie_app/screens/dashboard/components/theater_section/theater_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../navigation/navi_item_none_arrow.dart';
import 'components/showtime_section/showtime.dart';

class AtDashboardScreen extends StatefulWidget {
  const AtDashboardScreen({super.key});

  @override
  State<AtDashboardScreen> createState() => _AtDashboardScreenState();
}

class _AtDashboardScreenState extends State<AtDashboardScreen> {
  List homeItems = ['Home 1', 'Home 2'];
  String valueChoose = '';
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
            margin: EdgeInsets.only(top: 50, left: 50 + 25, bottom: 50),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                AddressList(),
                SizedBox(width: 24),
                TheaterList(),
                SizedBox(width: 24),
                ShowTime()
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
