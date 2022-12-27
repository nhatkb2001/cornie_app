class TheaterDetailModel {
  final String id;
  final String name;
  final List listMovies;
  final String address;
  final String city;
  TheaterDetailModel(
      {required this.id,
      required this.name,
      required this.listMovies,
      required this.address,
      required this.city});

  factory TheaterDetailModel.fromDocument(Map<String, dynamic> doc) {
    return TheaterDetailModel(
        id: doc['id'],
        name: doc['name'],
        listMovies: doc['listMovies'],
        address: doc['address'],
        city: doc['city']);
  }
}
