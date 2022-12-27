import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/theaterModel.dart';

class TheaterController {
  Future getTheaterList(List<TheaterModel> theaterList) async {
    FirebaseFirestore.instance
        .collection("theaters")
        .snapshots()
        .listen((value) {
      for (var element in value.docs) {
        theaterList.add(TheaterModel.fromDocument(element.data()));
      }
    });
    return theaterList;
  }
}
