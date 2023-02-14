import 'package:cornie_app/constants/colors.dart';
import 'package:cornie_app/screens/detail/components/tabInfoSection/tabInfor.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class TabInfo extends StatelessWidget {
  TabInfo({super.key, required this.id, required this.userId});
  String id;
  String userId;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      child: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 0,
            backgroundColor: AppColors.white,
            foregroundColor: AppColors.alt300,
            bottom: const TabBar(
              indicatorColor: AppColors.alt300,
              tabs: [
                Tab(text: 'Thông tin phim'),
                Tab(text: 'Lịch chiếu'),
                Tab(
                  text: 'Đánh giá',
                ),
                Tab(
                  text: 'Tin tức',
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              TabInfor(
                id: id,
                userId: userId,
              ),
              Icon(Icons.directions_transit),
              Icon(Icons.directions_bike),
              Icon(Icons.directions_bike),
            ],
          ),
        ),
      ),
    );
  }
}
