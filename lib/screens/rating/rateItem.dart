import 'package:cornie_app/constants/colors.dart';
import 'package:cornie_app/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class RatingItem extends StatefulWidget {
  RatingItem({
    super.key,
  });

  @override
  State<RatingItem> createState() => _RatingItemState();
}

class _RatingItemState extends State<RatingItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 800,
        padding: EdgeInsets.only(left: 24, right: 24, top: 16, bottom: 16),
        margin: EdgeInsets.only(top: 16),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 48,
                  width: 48,
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
                      Row(
                        children: [
                          const Text(
                            'htgiau',
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'Propins',
                              fontWeight: FontWeight.w700,
                              color: AppColors.black,
                            ),
                          ),
                          const Text(
                            ' rated: 7',
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'Propins',
                              fontWeight: FontWeight.w400,
                              color: AppColors.grey700,
                            ),
                          ),
                          SizedBox(width: 8),
                          Container(
                            height: 24,
                            width: 24,
                            child: Icon(
                              Iconsax.star,
                              size: 24,
                              color: Colors.amber,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: 8),
            const Text(
              'Hôm Avatar 2: Dòng Chảy Của Nước chiếu cũng lật đật xách cái mông lên đi coi. Tới nơi rạp tư vấn chị coi định dạng 3D cho nó cháy cũng nhanh nhảu ừ ừ dạ dạ em coi Imax, 3D các kiểu mà quên mình đang đeo cái kính cận suốt 26 năm cuộc đời. Hên quá kính 3D nó to hơn kính cận nên đeo chồng được. Hơi cộm với thành 6 mắt mà đáng. Phần 2 xuất sắc. Hình ảnh hiệu ứng ăn đứt mấy bên Marvel với DC. Nội dung hơi buồn tí là giống phần 1 nhưng coi đã mắt đã tai, chạm đúng cảm xúc, nên không phàn nàn gì. Cốt truyện dễ đoán á, được cái mấy trận đánh nhau có cảm xúc hơn phần đầu, kịch tính hơn. Cuối năm đi coi phim này không sợ tiếc tiền.',
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'Propins',
                fontWeight: FontWeight.w300,
                color: AppColors.grey500,
              ),
            ),
            SizedBox(height: 8),
            Container(
              height: 1,
              width: 800,
              decoration: BoxDecoration(
                color: AppColors.grey200,
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      color: AppColors.white,
                      border: Border.all(color: AppColors.grey700)),
                  child: Center(
                    child: const Icon(
                      Iconsax.like_1,
                      color: AppColors.grey900,
                      size: 16,
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      color: AppColors.white,
                      border: Border.all(color: AppColors.grey700)),
                  child: Center(
                    child: const Icon(
                      Iconsax.dislike,
                      color: AppColors.grey900,
                      size: 16,
                    ),
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
