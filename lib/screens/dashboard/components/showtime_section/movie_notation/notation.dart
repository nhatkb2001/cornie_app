import 'package:cornie_app/constants/colors.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:iconsax/iconsax.dart';

class Notation extends StatelessWidget {
  const Notation({super.key});

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      color: AppColors.info,
      strokeWidth: 2,
      dashPattern: [7, 10],
      child: Container(
        width: 648,
        height: 84,
        color: AppColors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.only(left: 20),
              height: 32,
              width: 110,
              child: Row(
                children: const [
                  Icon(
                    Iconsax.info_circle,
                    size: 24,
                    color: AppColors.info,
                  ),
                  SizedBox(width: 14),
                  Text('Ký hiệu:',
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          color: AppColors.info)),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 16),
              height: 32,
              width: 110,
              child: Row(
                children: [
                  Container(
                    height: 32,
                    width: 32,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.grey200,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8))),
                    child: const Center(
                      child: Icon(
                        Iconsax.stop,
                        size: 24,
                        color: AppColors.grey200,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Text('Đã chiếu',
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          color: AppColors.grey900)),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 16),
              height: 32,
              width: 110,
              child: Row(
                children: [
                  Container(
                    height: 32,
                    width: 32,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.orange,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8))),
                    child: const Center(
                      child: Icon(
                        Iconsax.play,
                        size: 24,
                        color: AppColors.orange,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Text('Sắp chiếu',
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          color: AppColors.grey900)),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 16),
              height: 32,
              width: 130,
              child: Row(
                children: [
                  Container(
                    height: 32,
                    width: 32,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.success,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8))),
                    child: const Center(
                      child: Icon(
                        Iconsax.play_circle,
                        size: 24,
                        color: AppColors.success,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Text('Đang chiếu',
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          color: AppColors.grey900)),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 16),
              height: 32,
              width: 100,
              child: Row(
                children: [
                  Container(
                    height: 32,
                    width: 32,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.error,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8))),
                    child: Center(
                      child: Icon(
                        Iconsax.timer,
                        size: 24,
                        color: AppColors.error,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Text('Hoãn',
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          color: AppColors.grey900)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
