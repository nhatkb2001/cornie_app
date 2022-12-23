import 'package:cornie_app/constants/colors.dart';
import 'package:cornie_app/screens/detail/components/heroSection/heroSection.dart';
import 'package:cornie_app/screens/detail/components/tabInfoSection/tabSection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class DetailMovie extends StatefulWidget {
  const DetailMovie({super.key});

  @override
  State<DetailMovie> createState() => _DetailMovieState();
}

class _DetailMovieState extends State<DetailMovie> {
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
            margin: EdgeInsets.only(top: 50, left: 50 + 25, bottom: 50),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  HeroSection(),
                  SizedBox(width: 24),
                  TabInfo(),
                  SizedBox(width: 24),
                ]),
          ),
        ),
      ),
    ));
  }
}
