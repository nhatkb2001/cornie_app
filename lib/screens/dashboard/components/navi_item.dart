import 'package:cornie_app/constants/colors.dart';
import 'package:cornie_app/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class NaviItem extends StatefulWidget {
  late String title;
  late List items;

  NaviItem({super.key, required this.title, required this.items});

  @override
  State<NaviItem> createState() => _NaviItemState();
}

class _NaviItemState extends State<NaviItem> {
  String valueChoose = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 108,
      child: DropdownButton(
        items: widget.items.map((valueItem) {
          return DropdownMenuItem(
            value: valueChoose,
            child: Text(
              valueItem,
              style: const TextStyle(
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  color: AppColors.black),
            ),
          );
        }).toList(),
        underline: const SizedBox(),
        onChanged: ((value) {
          setState(() {
            valueChoose = value!;
          });
        }),
        icon: const Icon(Iconsax.arrow_down_1),
        hint: Center(
          child: Text(
            widget.title,
            style: const TextStyle(
                fontSize: 16,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                color: AppColors.black),
          ),
        ),
        iconSize: 24,
        isExpanded: true,
        style: const TextStyle(
            fontSize: 16,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
            color: Colors.black),
      ),
    );
  }
}
