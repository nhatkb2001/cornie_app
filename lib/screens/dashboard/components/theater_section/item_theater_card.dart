// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// import '../../../../constants/colors.dart';
// import '../../../../models/theaterModel.dart';

// class itemTheaterCard extends StatefulWidget {
//   const itemTheaterCard(
//       {super.key, required this.theater});
//   final TheaterModel theater;

//   @override
//   State<itemTheaterCard> createState() => _itemTheaterCardState();
// }

// class _itemTheaterCardState extends State<itemTheaterCard> {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Container(
//           height: 52,
//           width: 312,
//           decoration: const BoxDecoration(
//               color: AppColors.alt100,
//               borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(8), topRight: Radius.circular(8))),
//           child: Container(
//             margin: const EdgeInsets.only(left: 16, top: 16, bottom: 16),
//             child: Row(
//               children: [
//                 Container(
//                   height: 24,
//                   width: 24,
//                   decoration: const BoxDecoration(
//                     image: DecorationImage(
//                         image: NetworkImage('https://i.imgur.com/4vcGpGz.png'),
//                         fit: BoxFit.contain),
//                     shape: BoxShape.rectangle,
//                   ),
//                 ),
//                 const SizedBox(width: 8),
//                 const Text(
//                   'Cinestar',
//                   textAlign: TextAlign.left,
//                   style: TextStyle(
//                       fontSize: 18,
//                       fontFamily: 'Poppins',
//                       fontWeight: FontWeight.w600,
//                       color: AppColors.grey900),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         Container(
//           width: 312,
//           child: ListView.builder(
//               itemCount: widgettheater.length,
//               scrollDirection: Axis.vertical,
//               shrinkWrap: true,
//               itemBuilder: (BuildContext context, int index) {
//                 return (index == (theater.length - 1))
//                     ? InkWell(
//                         onTap: () {
//                           setState(() {
//                             if (itemChosed == index) {
//                               itemChosed = -1;
//                             } else {
//                               itemChosed = index;
//                             }
//                           });
//                         },
//                         child: item_theater_end(
//                             theater: theater[index],
//                             description: description[index],
//                             picked: (itemChosed == index) ? true : false),
//                       )
//                     : InkWell(
//                         onTap: () {
//                           setState(() {
//                             if (itemChosed == index) {
//                               itemChosed = -1;
//                             } else {
//                               itemChosed = index;
//                             }
//                           });
//                         },
//                         child: item_theater(
//                             theater: theater[index],
//                             description: description[index],
//                             picked: (itemChosed == index) ? true : false),
//                       );
//               }),
//         )
//       ],
//     );
//   }
// }
