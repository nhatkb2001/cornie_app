import 'package:cornie_app/constants/colors.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
class TabInfo extends StatelessWidget {
  const TabInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 50, right: 50),
      height: 300,
      child: DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.white,
            foregroundColor: AppColors.alt300,
            bottom: const TabBar(
              indicatorColor: AppColors.alt500,
              tabs: [
                Tab(text: 'Thông tin phim'),
                Tab(text: 'Lịch chiếu'),
                Tab(
                  text: 'Đánh giá',
                ),
                Tab(
                  text: 'Mua vé',
                ),
                Tab(
                  text: 'Tin tức',
                ),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              Icon(Icons.directions_car),
              Icon(Icons.directions_transit),
              Icon(Icons.directions_bike),
            ],
          ),
        ),
      ),
    );
  }
}
