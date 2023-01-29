import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cornie_app/constants/colors.dart';
import 'package:cornie_app/constants/styles.dart';
import 'package:cornie_app/models/newModel.dart';
import 'package:cornie_app/screens/navigation/navigation_noneBody.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class NewDetail extends StatefulWidget {
  NewDetail({super.key, required this.id});
  String id;

  @override
  State<NewDetail> createState() => _NewDetailState();
}

class _NewDetailState extends State<NewDetail> {
  String link = 'https://i.imgur.com/Xi5VktM.jpg';
  List arr = [
    'https://i.imgur.com/Xi5VktM.jpg',
    'Loạt phim Việt ra rạp năm nay bị khán giả, giới chuyên môn chê "thảm họa", nhiều nhà sản xuất lỗ nặng dù đầu tư hàng chục tỷ đồng. Đầu tháng 12, Huyền sử vua Đinh (đạo diễn Anthony Võ) - phim về vua Đinh Bộ Lĩnh - ngưng chiếu ở rạp sau 10 ngày thu 43 triệu đồng, thấp nhất trong số phim chiếu rạp. Ngoài kịch bản bị chê ôm đồm, phim mắc nhiều lỗi kỹ thuật. Đạo diễn cho biết êkíp "thua trắng", ôm bài học lớn khi chạm vào thể loại chính sử.'
  ];
  NewModel news = NewModel(
      id: '',
      idOwner: '',
      timeCreate: '',
      contents: [],
      liked: [],
      title: '',
      posterNew: '');

  Future getNews() async {
    FirebaseFirestore.instance
        .collection("news")
        .where('id', isEqualTo: widget.id)
        .snapshots()
        .listen((value) {
      setState(() {
        news = NewModel.fromDocument(value.docs.first.data());
      });
    });
  }

  @override
  void initState() {
    getNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        color: AppColors.grey100,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                  margin: const EdgeInsets.only(left: 24, top: 12),
                  child: const Icon(
                    Iconsax.back_square,
                    size: 28,
                    color: AppColors.grey900,
                  )),
            ),
            Container(
                width: 800 + 48,
                alignment: Alignment.center,
                margin: const EdgeInsets.only(left: 240, top: 12),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                ),
                padding:
                    EdgeInsets.only(left: 24, right: 24, top: 16, bottom: 24),
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 800,
                          child: Text(
                            news.title,
                            style: const TextStyle(
                              fontSize: 18,
                              decoration: TextDecoration.none,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w700,
                              color: AppColors.black,
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          news.timeCreate,
                          style: const TextStyle(
                            fontSize: 18,
                            fontFamily: 'Poppins',
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.w400,
                            color: AppColors.grey700,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    SizedBox(
                        width: 800,
                        child: ListView.builder(
                            itemCount: news.contents.length,
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) {
                              return (news.contents[index].contains('.jpg'))
                                  ? Container(
                                      width: 600,
                                      height: 450,
                                      margin: const EdgeInsets.only(top: 24),
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(8)),
                                      ),
                                      child: ClipRRect(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(8)),
                                        child: FittedBox(
                                          child: Image.network(
                                              news.contents[index],
                                              width: 450,
                                              height: 450,
                                              fit: BoxFit.contain),
                                        ),
                                      ),
                                    )
                                  : Container(
                                      width: 1200 - 48,
                                      margin: const EdgeInsets.only(top: 24),
                                      child: Text(
                                        news.contents[index],
                                        style: TextStyle(
                                          decoration: TextDecoration.none,
                                          fontSize: 16,
                                          height: 1.5,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.black,
                                        ),
                                      ),
                                    );
                            })),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
