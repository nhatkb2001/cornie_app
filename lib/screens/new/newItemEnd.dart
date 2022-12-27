import 'package:cornie_app/constants/colors.dart';
import 'package:cornie_app/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class NewItemEnd extends StatefulWidget {
  NewItemEnd({
    super.key,
  });

  @override
  State<NewItemEnd> createState() => _NewItemEndState();
}

class _NewItemEndState extends State<NewItemEnd> {
  String valueChoose = '';

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 800,
        padding: EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 150,
              width: 200,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
            ),
            SizedBox(width: 24),
            Container(
              width: 800 - 300 - 24,
              padding: EdgeInsets.only(right: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Avatar 2: Dòng Chảy Của Nước vs Avatar 1 - Bạn thuộc phe nào?',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Propins',
                      fontWeight: FontWeight.w700,
                      color: AppColors.black,
                    ),
                  ),
                  SizedBox(height: 8),
                  const Text(
                    '2 giờ trước',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Propins',
                      fontWeight: FontWeight.w400,
                      color: AppColors.grey700,
                    ),
                  ),
                  SizedBox(height: 16),
                  const Text(
                    'Chưa gì dân tình đã chia bè phái để dành nhau xem phần nào của Avatar mới là phần hay nhất.',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Propins',
                      fontWeight: FontWeight.w300,
                      color: AppColors.grey700,
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
