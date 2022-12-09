import 'package:cornie_app/constants/colors.dart';
import 'package:cornie_app/constants/images.dart';
import 'package:cornie_app/screens/dashboard/components/navi_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AppBarNavigation extends StatefulWidget {
  const AppBarNavigation({super.key});

  @override
  State<AppBarNavigation> createState() => _AppBarNavigationState();
}

class _AppBarNavigationState extends State<AppBarNavigation> {
  List homeItems = ['Home 1', 'Home 2'];
  String valueChoose = '';
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.grey700.withOpacity(0.6),
            spreadRadius: 0,
            blurRadius: 2,
            offset: const Offset(0, 2), // changes position of shadow
          ),
          BoxShadow(
            color: AppColors.grey700.withOpacity(0.8),
            spreadRadius: 0,
            blurRadius: 4,
            offset: const Offset(0, 4), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 300, right: 300),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // const SizedBox(
            //   height: 18,
            //   child: Image(
            //     image: AssetImage(ImageAssets.icon),
            //     fit: BoxFit.cover,
            //   ),
            // ),
            const SizedBox(width: 49),
            Row(
              children: [
                // NaviItem(
                //   items: homeItems,
                //   title: 'Mua vé',
                // ),
                Text(
                  'Mua vé',
                  style: const TextStyle(
                      fontSize: 16,
                      height: 24,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      color: AppColors.black),
                ),
                const SizedBox(width: 26.72),
                NaviItem(
                  items: homeItems,
                  title: 'Phim',
                ),
                const SizedBox(width: 26.72),
                NaviItem(
                  items: homeItems,
                  title: 'Rạp',
                ),
                const SizedBox(width: 26.72),
                NaviItem(
                  items: homeItems,
                  title: 'Tin tức',
                ),
                const Text(
                  "widget.title",
                  style: TextStyle(
                      fontSize: 16,
                      height: 24,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      color: AppColors.black),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
