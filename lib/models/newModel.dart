class NewModel {
  final String id;
  final String idOwner;
  final String timeCreate;
  final String title;
  final List contents;
  final List liked;
  final String posterNew;
  NewModel(
      {required this.id,
      required this.idOwner,
      required this.timeCreate,
      required this.contents,
      required this.liked,
      required this.posterNew,
      required this.title});

  factory NewModel.fromDocument(Map<String, dynamic> doc) {
    return NewModel(
        id: doc['id'],
        idOwner: doc['idOwner'],
        timeCreate: doc['timeCreate'],
        contents: doc['contents'],
        liked: doc['liked'],
        posterNew: doc['posterNew'],
        title: doc['title']);
  }
}
