import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cornie_app/constants/colors.dart';
import 'package:cornie_app/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../models/newModel.dart';

class NewItemEnd extends StatefulWidget {
  NewItemEnd({super.key, required this.id});
  String id;

  @override
  State<NewItemEnd> createState() => _NewItemEndState();
}

class _NewItemEndState extends State<NewItemEnd> {
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
              decoration: const BoxDecoration(
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
                    maxLines: 5,
                    style: const TextStyle(
                      fontSize: 16,
                      height: 1.5,
                      overflow: TextOverflow.ellipsis,
                      fontFamily: 'Poppins',
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
