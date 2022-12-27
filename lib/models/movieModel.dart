class MovieModel {
  final String id;
  final String ageLimit;
  final String name;
  final String description;
  final String duration;
  final String poster;
  final String image;
  final String startTime;
  final String type;
  final String typeSub;
  final List actorList;
  final List director;
  final List publisher;
  MovieModel(
      {required this.id,
      required this.ageLimit,
      required this.name,
      required this.description,
      required this.duration,
      required this.poster,
      required this.image,
      required this.startTime,
      required this.type,
      required this.typeSub,
      required this.actorList,
      required this.director,
      required this.publisher});

  factory MovieModel.fromDocument(Map<String, dynamic> doc) {
    return MovieModel(
      id: doc['id'],
      ageLimit: doc['ageLimit'],
      name: doc['name'],
      description: doc['description'],
      duration: doc['duration'],
      poster: doc['poster'],
      image: doc['image'],
      startTime: doc['startTime'],
      type: doc['type'],
      typeSub: doc['typeSub'],
      actorList: doc['actorList'],
      director: doc['director'],
      publisher: doc['publisher'],
    );
  }
}
