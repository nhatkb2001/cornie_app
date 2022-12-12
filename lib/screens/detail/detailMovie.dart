import 'package:cornie_app/screens/detail/components/heroSection/heroSection.dart';
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
    return Container(
      child: HeroSection(),
    );
  }
}
