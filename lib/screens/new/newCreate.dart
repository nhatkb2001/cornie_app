import 'dart:html';
import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cornie_app/constants/colors.dart';
import 'package:cornie_app/constants/styles.dart';
import 'package:cornie_app/models/newModel.dart';
import 'package:cornie_app/screens/navigation/navigation_noneBody.dart';
import 'package:cornie_app/screens/new/newCreateDialog.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'dart:html' as html;
import 'package:mime_type/mime_type.dart';
import 'package:path/path.dart' as Path;

import 'package:image_picker_web/image_picker_web.dart';

class NewCreateSceen extends StatefulWidget {
  NewCreateSceen({super.key, required this.id});
  String id;

  @override
  State<NewCreateSceen> createState() => _NewCreateSceenState();
}

class _NewCreateSceenState extends State<NewCreateSceen> {
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
  String lable = '';
  late Uint8List dataImage;

  Future<void> getImageInfos() async {
    // Uint8List? fromPicker = await ImagePickerWeb.getImageAsBytes();
    // print(fromPicker);
    // if (fromPicker != null) {
    //   setState(() {
    //     dataImage = fromPicker;
    //     print(dataImage);
    //   });
    // }
    String imgUrl;
    InputElement input = FileUploadInputElement() as InputElement;
    FirebaseStorage fs = FirebaseStorage.instance;
    input.click();
    input.onChange.listen((event) {
      final file = input.files!.first;
      final reader = FileReader();
      reader.readAsDataUrl(file);
      reader.onLoadEnd.listen((event) async {
        var snapshot = await fs.ref().child('image' + file.name).putBlob(file);
        String downloadUrl = await snapshot.ref.getDownloadURL();
        setState(() {
          imgUrl = downloadUrl;
          news.contents.add(imgUrl);
        });
      });
    });
  }

  String title = '';
  String urlPoster = '';
  Future UpNew() async {
    var value = await FirebaseFirestore.instance.collection("news").add({
      'idOwner': widget.id,
      'timeCreate':
          "${DateFormat('y MMMM d, hh:mm:ss').format(DateTime.now())}",
      'contents': FieldValue.arrayUnion(news.contents),
      'liked': FieldValue.arrayUnion([]),
      'posterNew': urlPoster,
      'title': title,
    });
    await FirebaseFirestore.instance
        .collection("news")
        .doc(value.id)
        .update({'id': value.id});

    Navigator.pop(context);
  }

  TextEditingController titleController = TextEditingController();
  TextEditingController urlController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          color: AppColors.grey100,
          height: 2000,
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
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
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      UpNew();
                    },
                    child: Container(
                        margin: const EdgeInsets.only(top: 12, right: 24),
                        child: const Icon(
                          Iconsax.save_add,
                          size: 28,
                          color: AppColors.grey900,
                        )),
                  ),
                ]),
                SizedBox(height: 24),
                Container(
                  padding: const EdgeInsets.only(left: 100, right: 100),
                  margin: EdgeInsets.only(bottom: 24),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                      color: AppColors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            "Write your Poster link",
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                color: AppColors.grey900),
                          ),
                          (urlPoster != '')
                              ? Container(
                                  margin: EdgeInsets.only(
                                      top: 24, left: 200, bottom: 32),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 600,
                                        height: 450,
                                        margin: EdgeInsets.only(left: 24),
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(8)),
                                        ),
                                        child: ClipRRect(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(8)),
                                          child: FittedBox(
                                            child: Image.network(urlPoster,
                                                width: 450,
                                                height: 450,
                                                fit: BoxFit.contain),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              : Container(
                                  alignment: Alignment.center,
                                  child: Form(
                                    // key: formKey,
                                    child: Container(
                                      width: 400,
                                      height: 48,
                                      padding: EdgeInsets.only(
                                          left: 10, right: 10, bottom: 12),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color: AppColors.white,
                                          border: Border.all(
                                              color: AppColors.grey500)),
                                      child: TextFormField(
                                          style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize: 16,
                                              color: AppColors.grey900,
                                              fontWeight: FontWeight.w400),
                                          controller: urlController,
                                          keyboardType: TextInputType.text,
                                          onChanged: (val) {
                                            setState(() {
                                              urlPoster = val;
                                            });
                                          },
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                          )),
                                    ),
                                  ),
                                ),
                          const Text(
                            "Write your Title",
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                color: AppColors.grey900),
                          ),
                          SizedBox(height: 8),
                          Container(
                            alignment: Alignment.center,
                            child: Form(
                              // key: formKey,
                              child: Container(
                                width: 400,
                                height: 48,
                                padding: EdgeInsets.only(
                                    left: 10, right: 10, bottom: 12),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: AppColors.white,
                                    border:
                                        Border.all(color: AppColors.grey500)),
                                child: TextFormField(
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 16,
                                        color: AppColors.grey900,
                                        fontWeight: FontWeight.w400),
                                    controller: titleController,
                                    keyboardType: TextInputType.text,
                                    onChanged: (val) {
                                      setState(() {
                                        title = val;
                                      });
                                    },
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                    )),
                              ),
                            ),
                          ),
                          SizedBox(height: 16),
                          Container(
                            margin: EdgeInsets.only(left: 200, right: 200),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    getImageInfos();
                                  },
                                  child: Container(
                                    height: 60,
                                    width: 60,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16.0),
                                      border:
                                          Border.all(color: AppColors.grey900),
                                      color: AppColors.white,
                                    ),
                                    child: Center(
                                        child: Icon(
                                      Iconsax.camera,
                                      color: AppColors.grey900,
                                    )),
                                  ),
                                ),
                                SizedBox(width: 24),
                                GestureDetector(
                                  onTap: () {
                                    showCreateContentDialog(context, widget.id)
                                        .then((value) {
                                      if (mounted) {
                                        setState(() {
                                          news.contents.add(value);
                                        });
                                      }
                                    });
                                  },
                                  child: Container(
                                    height: 60,
                                    width: 60,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16.0),
                                      border:
                                          Border.all(color: AppColors.grey900),
                                      color: AppColors.white,
                                    ),
                                    child: Center(
                                        child: Icon(
                                      Iconsax.document,
                                      color: AppColors.grey900,
                                    )),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 24),
                            child: ListView.builder(
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                itemCount: news.contents.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Column(
                                    children: [
                                      news.contents.isNotEmpty
                                          ? (news.contents[index]
                                                  .contains('.jpg'))
                                              ? Container(
                                                  margin: EdgeInsets.only(
                                                      top: 24, left: 200),
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      GestureDetector(
                                                        onTap: () {
                                                          setState(() {
                                                            news.contents
                                                                .removeAt(
                                                                    index);
                                                          });
                                                        },
                                                        child: Container(
                                                          height: 24,
                                                          width: 24,
                                                          child: Icon(Iconsax
                                                              .pen_remove),
                                                        ),
                                                      ),
                                                      Container(
                                                        width: 600,
                                                        height: 450,
                                                        margin: EdgeInsets.only(
                                                            left: 24),
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              const BorderRadius
                                                                      .all(
                                                                  Radius
                                                                      .circular(
                                                                          8)),
                                                        ),
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              const BorderRadius
                                                                      .all(
                                                                  Radius
                                                                      .circular(
                                                                          8)),
                                                          child: FittedBox(
                                                            child: Image.network(
                                                                news.contents[
                                                                    index],
                                                                width: 450,
                                                                height: 450,
                                                                fit: BoxFit
                                                                    .contain),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              : Container(
                                                  width: 1200,
                                                  margin:
                                                      EdgeInsets.only(top: 24),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16.0),
                                                    border: Border.all(
                                                        color:
                                                            AppColors.grey900),
                                                    color: AppColors.grey100,
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        GestureDetector(
                                                          onTap: () {
                                                            setState(() {
                                                              news.contents
                                                                  .removeAt(
                                                                      index);
                                                            });
                                                          },
                                                          child: Container(
                                                            height: 24,
                                                            width: 24,
                                                            child: Icon(Iconsax
                                                                .pen_remove),
                                                          ),
                                                        ),
                                                        Container(
                                                          width: 1200 - 48 - 18,
                                                          margin:
                                                              EdgeInsets.only(
                                                                  left: 24),
                                                          child: Text(
                                                            news.contents[
                                                                index],
                                                            style: TextStyle(
                                                              decoration:
                                                                  TextDecoration
                                                                      .none,
                                                              fontSize: 16,
                                                              height: 1.5,
                                                              fontFamily:
                                                                  'Poppins',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              color: AppColors
                                                                  .black,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                )
                                          : Container()
                                    ],
                                  );
                                }),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
