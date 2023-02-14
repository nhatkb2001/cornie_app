import 'package:cornie_app/models/comboModel.dart';

class TicketModel {
  final String id;
  final String idOwner;
  late List<ComboModel> description;
  final String timeCreate;
  final String total;
  final String nameMoive;
  final String nameTheater;
  final String date;
  final Map<String, dynamic> map;
  TicketModel(
      {required this.id,
      required this.idOwner,
      required this.timeCreate,
      required this.total,
      required this.nameMoive,
      required this.nameTheater,
      required this.map,
      required this.date});

  factory TicketModel.fromDocument(Map<String, dynamic> doc) {
    return TicketModel(
        id: doc['id'],
        idOwner: doc['idOwner'],
        timeCreate: doc['timeCreate'],
        total: doc['total'],
        nameMoive: doc['nameMoive'],
        nameTheater: doc['nameTheater'],
        map: doc['map'],
        date: doc['date']);
  }
}
