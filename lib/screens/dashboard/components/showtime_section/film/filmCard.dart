import 'package:cornie_app/constants/colors.dart';
import 'package:cornie_app/screens/dashboard/components/showtime_section/film/schedule_film_card.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:iconsax/iconsax.dart';

class FilmCard extends StatefulWidget {
  const FilmCard({super.key});

  @override
  State<FilmCard> createState() => _FilmCardState();
}

class _FilmCardState extends State<FilmCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 648,
      decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.all(Radius.circular(8))),
      child: Container(
        margin: EdgeInsets.only(top: 24),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 24, bottom: 24),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                child: Image.network('https://i.imgur.com/VPiNCgs.jpg',
                    width: 100, height: 160, fit: BoxFit.contain),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 24, bottom: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Chiến Binh Báo Đen: Wakanda Bất Diệt',
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          color: AppColors.grey900)),
                  SizedBox(height: 8),
                  Text('Black Panther: Wakanda Forever · NC13 · 2h41',
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          color: AppColors.grey700)),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Container(
                        height: 24,
                        width: 24,
                        decoration: const BoxDecoration(
                            color: AppColors.alt300,
                            borderRadius: BorderRadius.all(Radius.circular(4))),
                        child: Center(
                          child: Image.network(
                            'https://i.imgur.com/dPsWVM2.png',
                            fit: BoxFit.contain,
                            height: 16,
                            width: 16,
                          ),
                        ),
                      ),
                      Container(
                        height: 24,
                        padding: EdgeInsets.only(left: 6, right: 6),
                        margin: EdgeInsets.only(left: 8),
                        decoration: const BoxDecoration(
                            color: AppColors.alt300,
                            borderRadius: BorderRadius.all(Radius.circular(4))),
                        child: const Center(
                          child: Text('Hành động',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.grey900)),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 16),
                  const Text('2D Phụ đề Việt',
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          color: AppColors.grey900)),
                  SizedBox(height: 16),
                  Container(
                    height: 88,
                    child: ListView.builder(
                        itemCount: 4,
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return const ScheduleFilmCard(
                            hour: '18.00',
                            picked: false,
                            price: '45' + 'K',
                            state: 'Play',
                          );
                        }),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
