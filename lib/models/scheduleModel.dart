class ScheduleModel {
  final String id;
  final String idMovie;
  final String idTheaterDetail;
  final String timeStart;
  final String date;
  final String price;
  ScheduleModel(
      {required this.id,
      required this.idMovie,
      required this.idTheaterDetail,
      required this.timeStart,
      required this.date,
      required this.price});

  factory ScheduleModel.fromDocument(Map<String, dynamic> doc) {
    return ScheduleModel(
        id: doc['id'],
        idMovie: doc['idMovie'],
        idTheaterDetail: doc['idTheaterDetail'],
        timeStart: doc['timeStart'],
        date: doc['date'],
        price: doc['price']);
  }
}
