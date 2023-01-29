import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cornie_app/constants/colors.dart';
import 'package:cornie_app/constants/images.dart';
import 'package:cornie_app/models/userModel.dart';
import 'package:cornie_app/screens/dashboard/components/address_section/address_list.dart';
import 'package:cornie_app/screens/dashboard/dashboard.dart';
import 'package:cornie_app/screens/navigation/navi_item.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../authentication/authentication.dart';
import '../navigation/navi_item_none_arrow.dart';

class NavigationUser extends StatefulWidget {
  String uid;
  NavigationUser({super.key, required this.uid});

  @override
  State<NavigationUser> createState() => _NavigationUserState(uid);
}

class _NavigationUserState extends State<NavigationUser> {
  int valueChoose = 1;
  PageController controller = PageController();

  TextEditingController searchController = TextEditingController();
  String uid = '';
  userModel user = userModel(
      id: '',
      email: '',
      fullName: '',
      userName: '',
      phoneNumber: '',
      avatar: '',
      favoriteList: [],
      saveList: [],
      role: '',
      gender: '',
      dob: '');

  _NavigationUserState(this.uid);
  Future getUserDetail(String uid) async {
    FirebaseFirestore.instance
        .collection("users")
        .where("id", isEqualTo: uid)
        .snapshots()
        .listen((value) {
      setState(() {
        user = userModel.fromDocument(value.docs.first.data());
      });
    });
  }

  @override
  void initState() {
    super.initState();
    User? user = FirebaseAuth.instance.currentUser;
    final userid = user?.uid.toString();
    uid = userid!;
    getUserDetail(uid);
  }

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
              margin: EdgeInsets.only(right: 300),
              child: NaviItemNoneArrow(
                items: ['Tin Điện Ảnh', 'Video'],
                title: 'Cộng đồng',
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(right: 24),
              child: Form(
                // key: formKey,
                child: Container(
                  width: 327,
                  height: 40,
                  padding: EdgeInsets.only(left: 2, right: 24),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColors.white,
                      border: Border.all(color: AppColors.grey500)),
                  alignment: Alignment.topCenter,
                  child: TextFormField(
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          color: AppColors.grey900,
                          fontWeight: FontWeight.w400),
                      controller: searchController,
                      keyboardType: TextInputType.text,
                      onChanged: (val) {},
                      decoration: InputDecoration(
                        prefixIcon: Container(
                            child: Stack(
                                alignment: Alignment.center,
                                children: [
                              Icon(Iconsax.search_normal_1,
                                  size: 20, color: AppColors.grey700)
                            ])),
                        border: InputBorder.none,
                        hintText: "What are you looking for?",
                        hintStyle: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            color: AppColors.black,
                            fontWeight: FontWeight.w400),
                      )),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                //Create news
              },
              child: Container(
                  margin: const EdgeInsets.only(right: 24),
                  width: 24,
                  child: const Icon(
                    Iconsax.location,
                    size: 28,
                    color: AppColors.grey900,
                  )),
            ),
            GestureDetector(
              onTap: () {
                //Create news
              },
              child: Container(
                  margin: const EdgeInsets.only(right: 24),
                  width: 30,
                  padding: EdgeInsets.only(top: 14, bottom: 14),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Image.network(
                      (user.avatar != '')
                          ? user.avatar
                          : 'https://i.imgur.com/RUgPziD.jpg',
                      fit: BoxFit.cover,
                      width: 30,
                      height: 24,
                    ),
                  )),
            ),
            // Container(
            //     height: 24,
            //     width: 24,
            //     decoration: BoxDecoration(
            //         border: Border.all(
            //           color: AppColors.black,
            //           width: 1,
            //         ),
            //         borderRadius: BorderRadius.all(Radius.circular(4))),
            //     child: )
          ],
        ),
        body: PageView(
          controller: controller,
          children: [AtDashboardScreen()],
        ));
  }
}
