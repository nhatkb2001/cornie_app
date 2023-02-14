class RatingModel {
  final String id;
  final String idOwner;
  final String timeCreate;
  final String rating;
  final String title;
  final String idMovie;
  RatingModel(
      {required this.id,
      required this.idOwner,
      required this.timeCreate,
      required this.idMovie,
      required this.rating,
      required this.title});

  factory RatingModel.fromDocument(Map<String, dynamic> doc) {
    return RatingModel(
        id: doc['id'],
        idOwner: doc['idOwner'],
        timeCreate: doc['timeCreate'],
        idMovie: doc['idMovie'],
        rating: doc['rating'],
        title: doc['title']);
  }
}
