import 'dart:ui';
import 'package:cornie_app/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:blur/blur.dart';
import 'package:flutter/material.dart';

class HeroSection extends StatefulWidget {
  const HeroSection({super.key});

  @override
  State<HeroSection> createState() => _HeroSectionState();
} /*  */

class _HeroSectionState extends State<HeroSection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage('https://i.imgur.com/VPiNCgs.jpg'),
                    fit: BoxFit.cover)),
            child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Row(children: [
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    margin: EdgeInsets.only(left: 50),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                      child: Image.network('https://i.imgur.com/VPiNCgs.jpg',
                          width: 200, height: 260, fit: BoxFit.cover),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(left: 24, bottom: 24, top: 30),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Chiến Binh Báo Đen: Wakanda Bất Diệt',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.white)),
                            SizedBox(height: 8),
                            Text('Black Panther: Wakanda Forever',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.alt100)),
                            SizedBox(height: 16),
                            Row(
                              children: [
                                ElevatedButton.icon(
                                  icon: Icon(
                                    Icons.favorite,
                                    size: 15,
                                  ),
                                  onPressed: () {},
                                  label: Text('Thích'),
                                  style: ElevatedButton.styleFrom(
                                    // elevation: 18,
                                    // shadowColor: Colors.white,
                                    primary: AppColors.alt300,
                                    onPrimary: AppColors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 16),
                                ElevatedButton.icon(
                                  icon: Icon(
                                    Icons.star,
                                    size: 15,
                                  ),
                                  onPressed: () {},
                                  label: Text('Đánh giá'),
                                  style: ElevatedButton.styleFrom(
                                    // elevation: 18,
                                    // shadowColor: Colors.white,
                                    primary: AppColors.alt300,
                                    onPrimary: AppColors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 16),
                                OutlinedButton(
                                  onPressed: () {},
                                  child: Text('Trailer'),
                                  style: OutlinedButton.styleFrom(
                                    // backgroundColor: Colors.white,// background
                                    primary: AppColors.white, // foreground text
                                    side: BorderSide(
                                        color: AppColors
                                            .white), // foreground border
                                  ),
                                ),
                                SizedBox(width: 16),
                                ElevatedButton(
                                  onPressed: () {},
                                  child: Text('Mua vé'),
                                  style: ElevatedButton.styleFrom(
                                    // elevation: 18,
                                    // shadowColor: Colors.white,
                                    primary: AppColors.error,
                                    onPrimary: AppColors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 16),
                            Container(
                                width: 600,
                                child: Text(
                                    'Nữ hoàng Ramonda, Shuri, M’Baku, Okoye và Dora Milaje chiến đấu để bảo vệ quốc gia của họ khỏi sự can thiệp của các thế lực thế giới sau cái chết của Vua T’Challa. Khi người Wakanda cố gắng nắm bắt chương tiếp theo của họ, các anh hùng phải hợp tác với nhau với sự giúp đỡ của War Dog Nakia và Everett Ross và tạo ra một con đường mới cho vương quốc Wakanda.',
                                    style: TextStyle(
                                        height: 1.3,
                                        fontSize: 16,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w300,
                                        color: AppColors.white))),
                            SizedBox(height: 16),
                            Row(
                              children: [
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          height: 24,
                                          width: 24,
                                          child: Center(
                                            child: Icon(
                                              Icons.thumb_up_alt_outlined,
                                              color: AppColors.white,
                                              size: 20,
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 8),
                                        Text('Hài lòng',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w600,
                                                color: AppColors.white)),
                                      ],
                                    ),
                                    SizedBox(width: 8),
                                    Text('90%',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w300,
                                            color: AppColors.white)),
                                  ],
                                ),
                                SizedBox(width: 20),
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          height: 24,
                                          width: 24,
                                          child: Center(
                                            child: Icon(
                                              Icons.event,
                                              color: AppColors.white,
                                              size: 20,
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 8),
                                        Text('Khởi chiếu',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w600,
                                                color: AppColors.white)),
                                      ],
                                    ),
                                    SizedBox(width: 8),
                                    Text('10/11/2022',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w300,
                                            color: AppColors.white)),
                                  ],
                                ),
                                SizedBox(width: 20),
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          height: 24,
                                          width: 24,
                                          child: Center(
                                            child: Icon(
                                              Icons.schedule_rounded,
                                              color: AppColors.white,
                                              size: 20,
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 8),
                                        Text('Thời lượng',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w600,
                                                color: AppColors.white)),
                                      ],
                                    ),
                                    SizedBox(width: 8),
                                    Text('161 phút',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w300,
                                            color: AppColors.white)),
                                  ],
                                ),
                                SizedBox(width: 20),
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          height: 24,
                                          width: 24,
                                          child: Center(
                                            child: Icon(
                                              Icons.person_off_outlined,
                                              color: AppColors.white,
                                              size: 20,
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 8),
                                        Text('Giới hạn tuổi',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w600,
                                                color: AppColors.white)),
                                      ],
                                    ),
                                    SizedBox(width: 8),
                                    Text('NC13',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w300,
                                            color: AppColors.white)),
                                  ],
                                ),
                              ],
                            ),
                          ])),
                  Container(
                      child: Column(
                    children: [
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 90),
                                Text('Diễn viên',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.white)),
                                SizedBox(height: 8),
                                Text(
                                    "Lupita Nyong'o, Letitia Wright, Danai Gurira, Winston Duke, Angela Bassett",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w300,
                                        color: AppColors.white)),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 20),
                                Text('Đạo diễn',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.white)),
                                SizedBox(height: 8),
                                Text("Ryan Coogler",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w300,
                                        color: AppColors.white)),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 20),
                                Text('Nhà sản xuất',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.white)),
                                SizedBox(height: 8),
                                Text("Kevin Feige",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w300,
                                        color: AppColors.white)),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 20),
                                Text('Vũ trụ điện ảnh',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.white)),
                                SizedBox(height: 8),
                                Text("Marvel Cinematic Universe",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w300,
                                        color: AppColors.white)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
                ]))));
  }
}
