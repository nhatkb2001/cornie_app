import 'package:cornie_app/constants/colors.dart';
import 'package:cornie_app/constants/images.dart';
import 'package:cornie_app/screens/dashboard/components/address_section/item_address.dart';
import 'package:cornie_app/screens/dashboard/components/address_section/item_address_end.dart';
import 'package:cornie_app/screens/dashboard/components/navi_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AddressList extends StatefulWidget {
  const AddressList({super.key});

  @override
  State<AddressList> createState() => _AddressListState();
}

class _AddressListState extends State<AddressList> {
  List homeItems = ['Home 1', 'Home 2'];
  String valueChoose = '';
  final List<String> address = <String>[
    'Tp. Hồ Chí Minh',
    'Tp. Thủ Đức',
    'Tp. Hải Phòng'
  ];
  final List<String> numberTheater = <String>['10', '5', '3'];
  int itemChosed = -1;
  bool checked = false;
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
              color: AppColors.alt400,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8), topRight: Radius.circular(8))),
          child: Container(
            margin: const EdgeInsets.only(left: 16, top: 16, bottom: 16),
            child: const Text(
              'Miền Bắc',
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
              itemCount: address.length,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return (index == (address.length - 1))
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
                        child: item_address_end(
                            address: address[index],
                            numberTheater: numberTheater[index],
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
                        child: item_address(
                            address: address[index],
                            numberTheater: numberTheater[index],
                            picked: (itemChosed == index) ? true : false),
                      );
              }),
        )
      ],
    );
  }
}
