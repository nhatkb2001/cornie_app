import 'package:cornie_app/constants/colors.dart';
import 'package:cornie_app/constants/images.dart';
import 'package:cornie_app/screens/dashboard/components/address_section/item_address.dart';
import 'package:cornie_app/screens/dashboard/components/address_section/item_address_end.dart';
import 'package:cornie_app/screens/navigation/navi_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AddressList extends StatefulWidget {
  const AddressList({super.key});

  @override
  State<AddressList> createState() => _AddressListState();
}

class _AddressListState extends State<AddressList> {
  String valueChoose = '';
  final List<String> addressSouth = <String>[
    'Tp. Hồ Chí Minh',
    'Đồng Nai',
    'Bình Dương',
    'Long An',
    'Tiền Giang',
    'Bà Rịa-Vũng Tàu',
    'Kiên Giang'
  ];
  final List<String> addressMid = <String>[
    'Bình Định',
    'Lâm Đồng',
    'Thừa Thiên Huế',
    'Đà Nẵng',
    'Gia Lai',
    'Khánh Hòa',
    'Kon Tum'
  ];
  final List<String> numberSouth = <String>['6', '4', '3', '3', '2', '2', '1'];
  final List<String> numberMid = <String>['1', '1', '1', '1', '1', '1', '1'];
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
              color: AppColors.alt100,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8), topRight: Radius.circular(8))),
          child: Container(
            margin: const EdgeInsets.only(left: 16, top: 16, bottom: 16),
            child: const Text(
              'Miền Nam',
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
              itemCount: addressSouth.length,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
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
                      address: addressSouth[index],
                      numberTheater: numberSouth[index],
                      picked: (itemChosed == index) ? true : false),
                );
              }),
        ),
        Container(
          height: 52,
          width: 312,
          decoration: const BoxDecoration(
            color: AppColors.alt100,
          ),
          child: Container(
            margin: const EdgeInsets.only(left: 16, top: 16, bottom: 16),
            child: const Text(
              'Miền Trung',
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
              itemCount: addressMid.length,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return (index == (addressMid.length - 1))
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
                            address: addressMid[index],
                            numberTheater: numberMid[index],
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
                            address: addressMid[index],
                            numberTheater: numberMid[index],
                            picked: (itemChosed == index) ? true : false),
                      );
              }),
        ),
      ],
    );
  }
}
