import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cornie_app/constants/colors.dart';
import 'package:flutter/material.dart';

import '../../models/communityModel.dart';
import '../../models/movieModel.dart';
import '../../models/userModel.dart';
import '../detail/detailMovie.dart';

class Community extends StatefulWidget {
  Community({super.key, required this.userId});
  String userId;

  @override
  State<Community> createState() => _CommunityState();
}

class _CommunityState extends State<Community> {
  bool isHover = false;
  // userModel user = userModel(
  //     id: '',
  //     email: '',
  //     fullName: '',
  //     userName: '',
  //     phoneNumber: '',
  //     avatar: '',
  //     favoriteList: [],
  //     saveList: [],
  //     role: '',
  //     gender: '',
  //     dob: '');

  // Future getUserDetail() async {
  //   FirebaseFirestore.instance
  //       .collection("users")
  //       .where("id", isEqualTo: widget.userId)
  //       .snapshots()
  //       .listen((value) {
  //     setState(() {
  //       user = userModel.fromDocument(value.docs.first.data());
  //     });
  //   });
  // }
  List<CommunityModel> communityList = [];
  Future getcommunityListDetail() async {
    FirebaseFirestore.instance
        .collection("community")
        .snapshots()
        .listen((value) {
      setState(() {
        communityList.clear();
        value.docs.forEach((element) {
          communityList.add(CommunityModel.fromDocument(element.data()));
        });
      });
    });
  }

  List<MovieModel> moviesList = [];
  Future getmovieListDetail() async {
    FirebaseFirestore.instance.collection("movies").snapshots().listen((value) {
      setState(() {
        moviesList.clear();
        value.docs.forEach((element) {
          moviesList.add(MovieModel.fromDocument(element.data()));
        });
      });
    });
  }

  @override
  void initState() {
    // getUserDetail();
    getmovieListDetail();
    getcommunityListDetail();
    super.initState();
  }

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
              padding:
                  EdgeInsets.only(top: 50, left: 24, bottom: 50, right: 24),
              margin: EdgeInsets.only(bottom: 30),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(24),
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            child: const Text(
                              'Thịnh hành',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 24,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.grey900),
                            ),
                          ),
                          SizedBox(height: 8),
                          Container(
                            alignment: Alignment.center,
                            child: const Text(
                              'Các phim được yêu thích trong tuần',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.grey500),
                            ),
                          ),
                          SizedBox(height: 24),
                          Container(
                            height: 200,
                            child: ListView.builder(
                                itemCount: moviesList.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: ((context) =>
                                                  DetailMovie(
                                                    id: moviesList[index].id,
                                                    userId: widget.userId,
                                                  ))));
                                    },
                                    child: Container(
                                      width: 120,
                                      height: 160,
                                      margin:
                                          EdgeInsets.only(left: 24, bottom: 24),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8)),
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8)),
                                        child: Image.network(
                                            moviesList[index].poster,
                                            fit: BoxFit.cover),
                                      ),
                                    ),
                                  );
                                }),
                          )
                        ]),
                  ),
                  Container(
                    padding: EdgeInsets.all(24),
                    decoration: BoxDecoration(
                        color: AppColors.grey100,
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            child: const Text(
                              'Cornie-er đang làm gì nhỉ?',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 24,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.grey900),
                            ),
                          ),
                          SizedBox(height: 24),
                          Container(
                            height: 400 + 24,
                            child: ListView.builder(
                                itemCount: communityList.length,
                                scrollDirection: Axis.vertical,
                                itemBuilder: (context, index) {
                                  return Container(
                                    padding: EdgeInsets.only(
                                        left: 24,
                                        right: 24,
                                        top: 14,
                                        bottom: 14),
                                    decoration: BoxDecoration(
                                        color: AppColors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8))),
                                    margin: EdgeInsets.only(bottom: 16),
                                    child: Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            //Create news
                                          },
                                          child: Container(
                                              margin: const EdgeInsets.only(
                                                  right: 24),
                                              width: 30,
                                              padding: EdgeInsets.only(
                                                  top: 14, bottom: 14),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                                child: Image.network(
                                                  'https://i.imgur.com/RUgPziD.jpg',
                                                  fit: BoxFit.cover,
                                                  width: 30,
                                                  height: 24,
                                                ),
                                              )),
                                        ),
                                        Container(
                                          child: Text(
                                            communityList[index].title,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w600,
                                                color: AppColors.grey900),
                                          ),
                                        ),
                                        Spacer(),
                                        Container(
                                          child: Text(
                                            communityList[index].timeCreate,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 10,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w600,
                                                color: AppColors.grey500),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                          )
                        ]),
                  )
                ],
              )),
        ),
      ),
    ));
  }
}
