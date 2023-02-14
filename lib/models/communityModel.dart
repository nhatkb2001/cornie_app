class CommunityModel {
  final String id;
  final String idOwner;
  final String timeCreate;
  final String rating;
  final String title;
  final String idMovie;
  CommunityModel(
      {required this.id,
      required this.idOwner,
      required this.timeCreate,
      required this.idMovie,
      required this.rating,
      required this.title});

  factory CommunityModel.fromDocument(Map<String, dynamic> doc) {
    return CommunityModel(
        id: doc['id'],
        idOwner: doc['idOwner'],
        timeCreate: doc['timeCreate'],
        idMovie: doc['idMovie'],
        rating: doc['rating'],
        title: doc['title']);
  }
}
