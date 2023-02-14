import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cornie_app/constants/colors.dart';
import 'package:cornie_app/constants/styles.dart';
import 'package:cornie_app/models/comboModel.dart';
import 'package:cornie_app/models/ticketModel.dart';
import 'package:cornie_app/screens/authentication/ticketDetail.dart';
import 'package:cornie_app/screens/booking/seatScreen.dart';
import 'package:cornie_app/screens/navigation/navigation_user.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

class TicketList extends StatefulWidget {
  String userId;

  TicketList({super.key, required this.userId});

  @override
  State<TicketList> createState() => _TicketListState();
}

class _TicketListState extends State<TicketList> {
  List<TicketModel> ticketList = [];
  Future getTicket() async {
    FirebaseFirestore.instance
        .collection("tickets")
        .where('idOwner', isEqualTo: widget.userId)
        .snapshots()
        .listen((value) {
      setState(() {
        ticketList.clear();
        value.docs.forEach((element) {
          ticketList.add(TicketModel.fromDocument(element.data()));
        });
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTicket();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          height: 1300,
          color: AppColors.grey100,
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(bottom: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 250),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          SizedBox(height: 60),
                          Container(
                            width: 800,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(6),
                                  topRight: Radius.circular(6)),
                              color: AppColors.grey200,
                            ),
                            padding: EdgeInsets.only(
                                top: 14, bottom: 14, left: 14, right: 14),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Danh sách vé đã mua",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.grey500,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Container(
                            width: 800,
                            decoration: const BoxDecoration(
                              color: AppColors.white,
                            ),
                            child: ListView.builder(
                                itemCount: ticketList.length,
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                itemBuilder: (BuildContext context, int index) {
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  TicketDetail(
                                                    userId: widget.userId,
                                                    ticketId:
                                                        ticketList[index].id,
                                                  )));
                                    },
                                    child: Container(
                                      width: 800,
                                      height: 72,
                                      padding: const EdgeInsets.only(
                                          left: 14, right: 14),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: AppColors.grey100),
                                        color: AppColors.white,
                                      ),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            ticketList[index].nameTheater,
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.grey700,
                                            ),
                                          ),
                                          Spacer(),
                                          Row(
                                            children: [
                                              Text(
                                                ticketList[index].nameMoive,
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.w600,
                                                  color: AppColors.grey500,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(width: 48),
                                          Row(
                                            children: [
                                              Text(
                                                ticketList[index].date,
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.w600,
                                                  color: AppColors.grey500,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                          ),
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
