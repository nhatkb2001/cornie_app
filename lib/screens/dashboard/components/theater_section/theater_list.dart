import 'package:cornie_app/constants/colors.dart';
import 'package:cornie_app/constants/images.dart';
import 'package:cornie_app/screens/dashboard/components/address_section/item_address.dart';
import 'package:cornie_app/screens/dashboard/components/address_section/item_address_end.dart';
import 'package:cornie_app/screens/dashboard/components/navi_item.dart';
import 'package:cornie_app/screens/dashboard/components/theater_section/item_theater.dart';
import 'package:cornie_app/screens/dashboard/components/theater_section/item_theater_end.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TheaterList extends StatefulWidget {
  const TheaterList({super.key});

  @override
  State<TheaterList> createState() => _TheaterListState();
}

class _TheaterListState extends State<TheaterList> {
  final List<String> theater = <String>[
    'Cinestar Quốc Thanh',
    'Cinestar Hai Bà Trưng',
    'Cinestar Nguyễn Thị Minh Khai'
  ];
  final List<String> description = <String>[
    '271 Nguyễn Trãi, P. Nguyễn Cư Trinh, Q.1, Tp. Hồ Chí Minh',
    '587 Hai Bà Trưng, P. Nguyễn Cư Trinh, Q.1, Tp. Hồ Chí Minh',
    '04 Nguyễn Thị Minh Khai, P. Nguyễn Cư Trinh, Q.1, Tp. Hồ Chí Minh'
  ];
  int itemChosed = -1;
  @override
  Widget build(BuildContext context) {
    return Column(
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
            )
          ],
        ),
        const SizedBox(height: 24),
        Container(
          height: 52,
          width: 312,
          decoration: const BoxDecoration(
              color: AppColors.alt400,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8), topRight: Radius.circular(8))),
          child: Container(
            margin: const EdgeInsets.only(left: 16, top: 16, bottom: 16),
            child: Row(
              children: [
                Container(
                  height: 24,
                  width: 24,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage('https://i.imgur.com/4vcGpGz.png'),
                        fit: BoxFit.contain),
                    shape: BoxShape.rectangle,
                  ),
                ),
                const SizedBox(width: 8),
                const Text(
                  'Cinestar',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      color: AppColors.grey900),
                ),
              ],
            ),
          ),
        ),
        Container(
          width: 312,
          child: ListView.builder(
              itemCount: theater.length,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return (index == (theater.length - 1))
                    ? InkWell(
                        onTap: () {
                          setState(() {
                            if (itemChosed == index) {
                              itemChosed = -1;
                            } else {
                              itemChosed = index;
                            }
                          });
                        },
                        child: item_theater_end(
                            theater: theater[index],
                            description: description[index],
                            picked: (itemChosed == index) ? true : false),
                      )
                    : InkWell(
                        onTap: () {
                          setState(() {
                            if (itemChosed == index) {
                              itemChosed = -1;
                            } else {
                              itemChosed = index;
                            }
                          });
                        },
                        child: item_theater(
                            theater: theater[index],
                            description: description[index],
                            picked: (itemChosed == index) ? true : false),
                      );
              }),
        )
      ],
    );
  }
}
