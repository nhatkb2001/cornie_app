import 'package:cornie_app/constants/colors.dart';
import 'package:cornie_app/screens/detail/components/heroSection/heroSection.dart';
import 'package:cornie_app/screens/detail/tabSection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class DetailMovie extends StatefulWidget {
  DetailMovie({super.key, required this.id});
  late String id;
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
            margin: EdgeInsets.only(bottom: 50),
            child: Column(
              children: [HeroSection(id: widget.id), TabInfo(id: widget.id)],
            ),
          ),
        ),
      ),
    ));
  }
}
