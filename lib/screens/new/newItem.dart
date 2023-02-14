import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cornie_app/constants/colors.dart';
import 'package:cornie_app/constants/styles.dart';
import 'package:cornie_app/models/newModel.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class NewItem extends StatelessWidget {
  NewItem({super.key, required this.news});
  NewModel news;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 800,
        color: AppColors.white,
        padding: EdgeInsets.only(left: 24, right: 24, top: 16),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 150,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Image.network(news.posterNew,
                          width: 200, height: 150, fit: BoxFit.cover),
                    ),
                  ),
                ),
                SizedBox(width: 24),
                Container(
                  width: 800 - 300 - 24,
                  padding: EdgeInsets.only(right: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        news.title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          color: AppColors.black,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        news.timeCreate,
                        style: const TextStyle(
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          color: AppColors.grey500,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        news.contents[0],
                        maxLines: 4,
                        style: const TextStyle(
                          fontSize: 16,
                          height: 1.5,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w300,
                          color: AppColors.grey700,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: 16),
            Container(
              height: 1,
              width: 800,
              decoration: BoxDecoration(
                color: AppColors.grey200,
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
            ),
          ],
        ));
  }
}
