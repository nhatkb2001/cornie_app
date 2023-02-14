import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cornie_app/constants/colors.dart';
import 'package:cornie_app/models/seatModel.dart';
import 'package:cornie_app/models/theaterDetail.dart';
import 'package:cornie_app/screens/booking/components/buildChair.dart';
import 'package:cornie_app/screens/booking/foodScreen.dart';
import 'package:cornie_app/screens/detail/components/heroSection/heroSection.dart';
import 'package:cornie_app/screens/detail/tabSection.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:iconsax/iconsax.dart';

import '../../models/movieModel.dart';
import '../../models/scheduleModel.dart';
import '../../models/theaterModel.dart';

class SeatScreen extends StatefulWidget {
  SeatScreen({super.key, required this.id, required this.userId});
  String id;
  String userId;

  @override
  State<SeatScreen> createState() => _SeatScreenState();
}

class _SeatScreenState extends State<SeatScreen> {
  // 1 is free seats
  // 2 is selected seats
  // 3 is reserved seats

  late List<List<int>> _chairStatus = [
    [1, 1, 1, 1, 1, 1, 1],
    [1, 1, 1, 1, 1, 1, 1],
    [1, 1, 1, 1, 1, 1, 1],
    [1, 1, 1, 1, 1, 1, 1],
    [1, 1, 1, 1, 1, 1, 1],
    [1, 1, 1, 1, 1, 1, 1],
  ];
  List<String> chairName = ['A', 'B', 'C', 'D', 'E', 'F'];
  int price = 0;
  List<SeatModel> seatList = [];

  ScheduleModel schedule = ScheduleModel(
      id: '',
      idMovie: '',
      idTheaterDetail: '',
      timeStart: '',
      date: '',
      idTheater: '',
      price: '',
      map: {});
  Future getSchedule() async {
    FirebaseFirestore.instance
        .collection("schedules")
        .where('id', isEqualTo: widget.id)
        .snapshots()
        .listen((value) {
      setState(() {
        schedule = ScheduleModel.fromDocument(value.docs.first.data());
        _chairStatus = (MatrixHelper.intMatrixFromMap(schedule.map));
        getFilm();
        getTheater();
      });
    });
  }

  MovieModel movie = MovieModel(
      id: '',
      ageLimit: '',
      name: '',
      description: '',
      duration: '',
      poster: '',
      image: '',
      startTime: '',
      type: '',
      typeSub: '',
      actorList: [],
      director: [],
      publisher: []);
  Future getFilm() async {
    FirebaseFirestore.instance
        .collection("movies")
        .where('id', isEqualTo: schedule.idMovie)
        .snapshots()
        .listen((value) {
      setState(() {
        movie = MovieModel.fromDocument(value.docs.first.data());
      });
    });
  }

  TheaterDetailModel theater = TheaterDetailModel(
      id: '', name: '', listMovies: [], address: '', city: '');
  Future getTheater() async {
    FirebaseFirestore.instance
        .collection("theaters")
        .doc(schedule.idTheater)
        .collection('theatersDetail')
        .where('id', isEqualTo: schedule.idTheaterDetail)
        .snapshots()
        .listen((value) {
      setState(() {
        theater = TheaterDetailModel.fromDocument(value.docs.first.data());
      });
    });
  }

  Future minus(SeatModel seat, List<SeatModel> list) async {
    setState(() {
      list.removeWhere((element) => element.name == seat.name);
      print(list.length);
    });
  }

  @override
  void initState() {
    // updateMatrix();
    getSchedule();
    seatList.clear();
    super.initState();
  }

//   await Firestore.instance.collection("anyCollection").add({
//     "matrix" : MatrixHelper.mapFromIntMatrix(myMatrix),
// });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          color: AppColors.grey100,
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(bottom: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 48,
                  color: AppColors.white,
                  padding: EdgeInsets.only(left: 300, right: 300),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        child: const Center(
                          child: Icon(
                            Iconsax.category,
                            size: 24,
                            color: AppColors.error,
                          ),
                        ),
                      ),
                      SizedBox(width: 16),
                      const Center(
                        child: Icon(
                          Iconsax.arrow_right_2,
                          size: 24,
                          color: AppColors.black,
                        ),
                      ),
                      SizedBox(width: 16),
                      Container(
                        height: 32,
                        width: 32,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColors.grey500,
                            ),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8))),
                        child: const Center(
                          child: Icon(
                            Iconsax.shopping_cart,
                            size: 24,
                            color: AppColors.grey500,
                          ),
                        ),
                      ),
                      SizedBox(width: 16),
                      const Center(
                        child: Icon(
                          Iconsax.arrow_right_2,
                          size: 24,
                          color: AppColors.grey500,
                        ),
                      ),
                      SizedBox(width: 16),
                      Container(
                        height: 32,
                        width: 32,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColors.grey500,
                            ),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8))),
                        child: const Center(
                          child: Icon(
                            Iconsax.card_edit,
                            size: 24,
                            color: AppColors.grey500,
                          ),
                        ),
                      ),
                      SizedBox(width: 16),
                      const Center(
                        child: Icon(
                          Iconsax.arrow_right_2,
                          size: 24,
                          color: AppColors.grey500,
                        ),
                      ),
                      SizedBox(width: 16),
                      Container(
                        height: 32,
                        width: 32,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColors.grey500,
                            ),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8))),
                        child: const Center(
                          child: Icon(
                            Iconsax.info_circle,
                            size: 24,
                            color: AppColors.grey500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 60),
                Container(
                    height: 32,
                    width: 600 + 48 + 8 - 200,
                    margin: EdgeInsets.only(left: 250 + 200),
                    child: Center(
                      child: Row(
                        children: [
                          Container(
                            height: 24.0,
                            width: 24.0,
                            decoration: BoxDecoration(
                                color: AppColors.grey500,
                                borderRadius: BorderRadius.circular(6.0)),
                          ),
                          SizedBox(width: 16),
                          Text(
                            'Ghế trống',
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                              color: AppColors.black,
                            ),
                          ),
                          SizedBox(width: 32),
                          Container(
                            height: 24.0,
                            width: 24.0,
                            decoration: BoxDecoration(
                                color: AppColors.grey900,
                                borderRadius: BorderRadius.circular(6.0)),
                          ),
                          SizedBox(width: 16),
                          Text(
                            'Ghế đã bán',
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                              color: AppColors.black,
                            ),
                          ),
                          SizedBox(width: 32),
                          Container(
                            height: 24.0,
                            width: 24.0,
                            decoration: BoxDecoration(
                                color: AppColors.green,
                                borderRadius: BorderRadius.circular(6.0)),
                          ),
                          SizedBox(width: 16),
                          Text(
                            'Ghế bạn chọn',
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                              color: AppColors.black,
                            ),
                          ),
                        ],
                      ),
                    )),
                SizedBox(height: 24),
                Container(
                    height: 32,
                    width: 600 + 48 + 8 - 200,
                    margin: EdgeInsets.only(left: 250 + 200),
                    decoration: BoxDecoration(
                        color: AppColors.grey900,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(6))),
                    child: Center(
                      child: Text(
                        'Màn Hình',
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          color: AppColors.white,
                        ),
                      ),
                    )),
                SizedBox(height: 24),
                Container(
                  padding: EdgeInsets.only(left: 250),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          width: 32,
                          child: Column(children: <Widget>[
                            for (int i = 0; i < chairName.length; i++)
                              Container(
                                margin: EdgeInsets.all(18 + 8),
                                child: Text(
                                  chairName[i],
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.black,
                                  ),
                                ),
                              )
                          ])),
                      Container(
                        width: 800,
                        child: Column(
                          children: <Widget>[
                            for (int i = 0; i < 6; i++)
                              Container(
                                margin: (i == 0)
                                    ? EdgeInsets.only(top: 0)
                                    : EdgeInsets.only(top: 16),
                                child: Row(
                                  children: <Widget>[
                                    for (int x = 0; x < 9; x++)
                                      Expanded(
                                        flex: x == 0 || x == 8 ? 2 : 1,
                                        child:
                                            x == 0 ||
                                                    x == 8 ||
                                                    (i == 0 && x == 1) ||
                                                    (i == 0 && x == 7) ||
                                                    (x == 4)
                                                ? Container()
                                                : Container(
                                                    height: 32,
                                                    margin: EdgeInsets.all(8),
                                                    child: _chairStatus[i]
                                                                [x - 1] ==
                                                            1
                                                        ? GestureDetector(
                                                            onTap: () {
                                                              setState(() {
                                                                _chairStatus[i]
                                                                    [x - 1] = 2;
                                                                price += 45;
                                                                print(x);
                                                                print(i);
                                                                print((i == 0)
                                                                    ? "$x" + "A"
                                                                    : (i == 1)
                                                                        ? "$x" +
                                                                            "B"
                                                                        : (i ==
                                                                                2)
                                                                            ? "$x" +
                                                                                "C"
                                                                            : (i == 3)
                                                                                ? "$x" + "D"
                                                                                : (i == 4)
                                                                                    ? "$x" + "E"
                                                                                    : "$x" + "F");
                                                                seatList.add(SeatModel(
                                                                    x,
                                                                    i,
                                                                    (i == 0)
                                                                        ? "$x" + "A"
                                                                        : (i == 1)
                                                                            ? "$x" + "B"
                                                                            : (i == 2)
                                                                                ? "$x" + "C"
                                                                                : (i == 3)
                                                                                    ? "$x" + "D"
                                                                                    : (i == 4)
                                                                                        ? "$x" + "E"
                                                                                        : "$x" + "F"));
                                                              });
                                                            },
                                                            child: BuildChairs.availableChair((i ==
                                                                    0)
                                                                ? "$x" + "A"
                                                                : (i == 1)
                                                                    ? "$x" + "B"
                                                                    : (i == 2)
                                                                        ? "$x" +
                                                                            "C"
                                                                        : (i ==
                                                                                3)
                                                                            ? "$x" +
                                                                                "D"
                                                                            : (i == 4)
                                                                                ? "$x" + "E"
                                                                                : "$x" + "F"),
                                                          )
                                                        : _chairStatus[i]
                                                                    [x - 1] ==
                                                                2
                                                            ? GestureDetector(
                                                                onTap: () {
                                                                  setState(() {
                                                                    _chairStatus[
                                                                            i][
                                                                        x - 1] = 1;
                                                                    price -= 45;
                                                                    minus(
                                                                        SeatModel(
                                                                            x,
                                                                            i,
                                                                            (i == 0)
                                                                                ? "$x" + "A"
                                                                                : (i == 1)
                                                                                    ? "$x" + "B"
                                                                                    : (i == 2)
                                                                                        ? "$x" + "C"
                                                                                        : (i == 3)
                                                                                            ? "$x" + "D"
                                                                                            : (i == 4)
                                                                                                ? "$x" + "E"
                                                                                                : "$x" + "F"),
                                                                        seatList);
                                                                  });
                                                                },
                                                                child: BuildChairs
                                                                    .selectedChair(),
                                                              )
                                                            : BuildChairs
                                                                .reservedChair(),
                                                  ),
                                      ),
                                  ],
                                ),
                              ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                            width: 300 + 56,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6.0),
                              color: AppColors.white,
                            ),
                            padding: EdgeInsets.only(
                                top: 14, bottom: 14, left: 14, right: 14),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  movie.name,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.black,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'Rạp: ' + theater.name,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.grey700,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'Suất ' +
                                      schedule.timeStart +
                                      " Ngày " +
                                      schedule.date,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.grey700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 24),
                          Container(
                            width: 300 + 56,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6.0),
                              color: AppColors.white,
                            ),
                            padding: EdgeInsets.only(
                                top: 14, bottom: 14, left: 14, right: 14),
                            child: Column(
                              children: [
                                Text(
                                  'TỔNG ĐƠN HÀNG',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.black,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  price.toString() + " K",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 24),
                          GestureDetector(
                            onTap: () {
                              if (widget.userId == '') {
                                Scaffold.of(context).openDrawer();
                              } else {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => FoodScreen(
                                              userId: widget.userId,
                                              schedulesId: widget.id,
                                              pricetotal: price,
                                              chairStatus: _chairStatus,
                                              seatList: seatList,
                                              date: 'Suất ' +
                                                  schedule.timeStart +
                                                  " Ngày " +
                                                  schedule.date,
                                              nameMovie: movie.name,
                                              nametheater: theater.name,
                                            )));
                              }
                            },
                            child: Container(
                              width: 300 + 56,
                              height: 48,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6.0),
                                color: AppColors.grey900,
                              ),
                              child: Center(
                                child: Text(
                                  "Tiếp tục",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.white,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}

class MatrixHelper {
  // Creates a map that can be stored in Firebase from an int matrix.
  static Map<String, dynamic> mapFromIntMatrix(List<List<int>> intMatrix) {
    Map<String, Map<String, dynamic>> map = {};
    int index = 0;
    for (List<int> row in intMatrix) {
      map.addEntries([MapEntry(index.toString(), {})]);
      int i = 0;
      for (int value in row) {
        map[index.toString()]
            ?.addEntries([MapEntry(i.toString(), value.toString())]);
        i += 1;
      }
      index += 1;
    }
    return map;
  }

  // Creates an int matrix from a dynamic map.
  static List<List<int>> intMatrixFromMap(Map<dynamic, dynamic> dynamicMap) {
    final map = Map<String, dynamic>.from(dynamicMap);
    List<List<int>> matrix = [];
    map.forEach((stringIndex, value) {
      Map<String, dynamic> rowMap = Map<String, dynamic>.from(value);
      List<int> row = [];
      rowMap.forEach((stringNumber, boolean) {
        row.add(int.parse(boolean));
      });
      matrix.add(row);
    });
    return matrix;
  }
}
