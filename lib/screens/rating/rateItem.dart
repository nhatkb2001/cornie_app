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
  String valueChoose = '';

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
              'H??m Avatar 2: D??ng Ch???y C???a N?????c chi???u c??ng l???t ?????t x??ch c??i m??ng l??n ??i coi. T???i n??i r???p t?? v???n ch??? coi ?????nh d???ng 3D cho n?? ch??y c??ng nhanh nh???u ??? ??? d??? d??? em coi Imax, 3D c??c ki???u m?? qu??n m??nh ??ang ??eo c??i k??nh c???n su???t 26 n??m cu???c ?????i. H??n qu?? k??nh 3D n?? to h??n k??nh c???n n??n ??eo ch???ng ???????c. H??i c???m v???i th??nh 6 m???t m?? ????ng. Ph???n 2 xu???t s???c. H??nh ???nh hi???u ???ng ??n ?????t m???y b??n Marvel v???i DC. N???i dung h??i bu???n t?? l?? gi???ng ph???n 1 nh??ng coi ???? m???t ???? tai, ch???m ????ng c???m x??c, n??n kh??ng ph??n n??n g??. C???t truy???n d??? ??o??n ??, ???????c c??i m???y tr???n ????nh nhau c?? c???m x??c h??n ph???n ?????u, k???ch t??nh h??n. Cu???i n??m ??i coi phim n??y kh??ng s??? ti???c ti???n.',
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
