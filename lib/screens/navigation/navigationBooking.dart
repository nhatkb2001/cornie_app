import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cornie_app/constants/colors.dart';
import 'package:cornie_app/constants/images.dart';
import 'package:cornie_app/models/userModel.dart';
import 'package:cornie_app/screens/booking/seatScreen.dart';
import 'package:cornie_app/screens/dashboard/components/address_section/address_list.dart';
import 'package:cornie_app/screens/dashboard/dashboard.dart';
import 'package:cornie_app/screens/navigation/avatar_item.dart';
import 'package:cornie_app/screens/navigation/navi_item.dart';
import 'package:cornie_app/screens/navigation/navigation.dart';
import 'package:cornie_app/screens/navigation/navigation_user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../authentication/authentication.dart';
import '../community/community.dart';
import '../navigation/navi_item_none_arrow.dart';

class NavigationBooking extends StatefulWidget {
  String id;
  String userId;
  NavigationBooking({super.key, required this.id, required this.userId});

  @override
  State<NavigationBooking> createState() => _NavigationBookingState();
}

class _NavigationBookingState extends State<NavigationBooking> {
  int valueChoose = 1;
  PageController controller = PageController();

  TextEditingController searchController = TextEditingController();
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

  Future getUserDetail(String uid) async {
    if (uid != '') {
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
  }

  @override
  void initState() {
    getUserDetail(widget.userId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Authentication(),
        appBar: AppBar(
          leading: widget.userId == ''
              ? Builder(
                  builder: (context) => GestureDetector(
                    onTap: () {
                      Scaffold.of(context).openDrawer();
                    },
                    child: Container(
                        margin: const EdgeInsets.only(left: 24),
                        child: const Icon(
                          Iconsax.user_octagon,
                          size: 28,
                          color: AppColors.grey900,
                        )),
                  ),
                )
              : Container(),
          backgroundColor: AppColors.white,
          actions: <Widget>[
            GestureDetector(
              onTap: () {
                setState(() {
                  widget.userId == ''
                      ? Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Navigation()))
                      : Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NavigationUser(
                                    uid: widget.userId,
                                  )));
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
                title: 'Phim',
                items: ['Lịch Chiếu', 'Đang Chiếu', 'Sắp Chiếu', 'Chiếu Sớm'],
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 16),
              child: NaviItemNoneArrow(
                items: ['Tin Điện Ảnh', 'Video'],
                title: 'Tin tức',
              ),
            ),
            GestureDetector(
              onTap: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => Community(
                //               userId: '',
                //             )));
                setState(() {
                  controller.jumpToPage(1);
                  print('okey');
                });
              },
              child: Container(
                margin: EdgeInsets.only(right: 300),
                child: NaviItemNoneArrow(
                  items: ['Tin Điện Ảnh', 'Video'],
                  title: 'Cộng đồng',
                ),
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
            widget.userId != ''
                ? GestureDetector(
                    onTap: () {
                      showProfileDialog(context, widget.userId);
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
                  )
                : Container()
          ],
        ),
        body: PageView(
          controller: controller,
          children: [
            SeatScreen(
              id: widget.id,
              userId: widget.userId,
            )
          ],
        ));
  }
}
