import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cornie_app/constants/colors.dart';
import 'package:cornie_app/constants/styles.dart';
import 'package:cornie_app/models/comboModel.dart';
import 'package:cornie_app/models/ticketModel.dart';
import 'package:cornie_app/screens/booking/seatScreen.dart';
import 'package:cornie_app/screens/navigation/navigation_user.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

class TicketDetail extends StatefulWidget {
  String ticketId;
  String userId;

  TicketDetail({super.key, required this.ticketId, required this.userId});

  @override
  State<TicketDetail> createState() => _TicketDetailState();
}

class _TicketDetailState extends State<TicketDetail> {
  String valueChoose = '';

  TicketModel ticket = TicketModel(
      id: '',
      idOwner: '',
      timeCreate: '',
      total: '',
      date: '',
      nameMoive: '',
      nameTheater: '',
      map: {});
  List<ComboModel> comboCheckOut_2 = [];
  Future getTicket() async {
    FirebaseFirestore.instance
        .collection("tickets")
        .where('id', isEqualTo: widget.ticketId)
        .snapshots()
        .listen((value) {
      setState(() {
        ticket = TicketModel.fromDocument(value.docs.first.data());
        comboCheckOut_2 = intMatrixFromMap(ticket.map);
      });
    });
  }

  static List<ComboModel> intMatrixFromMap(Map<dynamic, dynamic> dynamicMap) {
    List<ComboModel> comboCheckOut = [];
    List mot = [];
    final map = Map<String, dynamic>.from(dynamicMap);
    map.forEach((stringIndex, value1) {
      Map<String, dynamic> rowMap = Map<String, dynamic>.from(value1);
      var dem = 0;
      mot = ['', '', ''];
      rowMap.entries.forEach((element) {
        if (element.key == 'name') {
          mot[0] = element.value;
        } else if (element.key == 'price') {
          mot[1] = element.value;
        } else if (element.key == 'quantity') {
          mot[2] = element.value;
        }
        dem++;
        if (dem == 3) {
          comboCheckOut
              .add(ComboModel(name: mot[0], price: mot[1], quantity: mot[2]));
        }
      });
      print(mot);
    });
    return comboCheckOut;
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
          color: AppColors.grey100,
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(bottom: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 250, top: 60),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          height: 24,
                          width: 24,
                          child: Icon(
                            Iconsax.arrow_left,
                            size: 24,
                            color: AppColors.black,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 250, top: 30),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
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
                                      "Thông tin vé đã mua",
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
                            decoration: BoxDecoration(
                                color: AppColors.grey100,
                                border: Border.all(color: AppColors.grey200)),
                            padding: EdgeInsets.only(
                                top: 14, bottom: 14, left: 14, right: 14),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "COMBO",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.grey500,
                                      ),
                                    ),
                                    Spacer(),
                                    Row(
                                      children: [
                                        Text(
                                          "SỐ LƯỢNG",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w600,
                                            color: AppColors.grey500,
                                          ),
                                        ),
                                        SizedBox(width: 24),
                                        Text(
                                          "GIÁ TIỀN",
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
                                itemCount: comboCheckOut_2.length,
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                itemBuilder: (BuildContext context, int index) {
                                  return Container(
                                    width: 800,
                                    height: 72,
                                    padding: const EdgeInsets.only(
                                        left: 14, right: 14),
                                    decoration: BoxDecoration(
                                      border:
                                          Border.all(color: AppColors.grey100),
                                      color: AppColors.white,
                                    ),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          comboCheckOut_2[index].name,
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
                                              comboCheckOut_2[index]
                                                  .quantity
                                                  .toString(),
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
                                              comboCheckOut_2[index]
                                                      .price
                                                      .toString() +
                                                  " K",
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
                                  );
                                }),
                          ),
                        ],
                      ),
                      SizedBox(width: 32),
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
                                  ticket.nameMoive,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.black,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'Rạp: ' + ticket.nameTheater,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.grey700,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  ticket.date,
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
                                  ticket.total + " K",
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
                          Container(
                            width: 300 + 56,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6.0),
                              color: AppColors.white,
                            ),
                            padding: EdgeInsets.only(
                                top: 14, bottom: 14, left: 14, right: 14),
                            child: Container(
                              width: 300,
                              child: Text(
                                'Vé đã mua không thể đổi hoặc hoàn tiền.Mã vé sẽ được gửi 01 lần qua số điện thoại và email đã nhập. Vui lòng kiểm tra lại thông tin trước khi tiếp tục.',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.black,
                                ),
                              ),
                            ),
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
