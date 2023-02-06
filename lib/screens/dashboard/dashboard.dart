import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cornie_app/constants/colors.dart';
import 'package:cornie_app/constants/images.dart';
import 'package:cornie_app/models/theaterModel.dart';
import 'package:cornie_app/screens/dashboard/components/address_section/address_list.dart';
import 'package:cornie_app/screens/navigation/navi_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../navigation/navi_item_none_arrow.dart';
import 'components/showtime_section/showtime.dart';

class AtDashboardScreen extends StatefulWidget {
  AtDashboardScreen({super.key, required this.userId});
  String userId;

  @override
  State<AtDashboardScreen> createState() => _AtDashboardScreenState();
}

class _AtDashboardScreenState extends State<AtDashboardScreen> {
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
            margin: EdgeInsets.only(top: 50, left: 24, bottom: 50),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AddressList(
                  userId: widget.userId,
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
