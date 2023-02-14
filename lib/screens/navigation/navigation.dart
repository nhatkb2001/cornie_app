import 'package:cornie_app/constants/colors.dart';
import 'package:cornie_app/constants/images.dart';
import 'package:cornie_app/screens/dashboard/components/address_section/address_list.dart';
import 'package:cornie_app/screens/dashboard/dashboard.dart';
import 'package:cornie_app/screens/navigation/navi_item.dart';
import 'package:cornie_app/screens/navigation/navigationCommunity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../authentication/authentication.dart';
import '../community/community.dart';
import '../navigation/navi_item_none_arrow.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int valueChoose = 1;
  PageController controller = PageController();

  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Authentication(),
        appBar: AppBar(
          leading: Builder(
            builder: (context) => GestureDetector(
              onTap: () {
                Scaffold.of(context).openDrawer();
                print('tap');
              },
              child: Container(
                  margin: const EdgeInsets.only(left: 24),
                  child: const Icon(
                    Iconsax.user_octagon,
                    size: 28,
                    color: AppColors.grey900,
                  )),
            ),
          ),
          backgroundColor: AppColors.white,
          actions: <Widget>[
            GestureDetector(
              onTap: () {
                setState(() {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Navigation()));
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
              child: NaviItemNoneArrow(
                items: ['Tin Điện Ảnh', 'Video'],
                title: 'Tin tức',
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => NavigationCommunity(
                              userId: '',
                            )));
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
          ],
        ),
        body: PageView(
          controller: controller,
          children: [
            AtDashboardScreen(
              userId: '',
            ),
            Community(
              userId: '',
            ),
            Community(
              userId: '',
            ),
            Community(
              userId: '',
            ),
          ],
        ));
  }
}
