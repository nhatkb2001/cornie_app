class TheaterModel {
  final String id;
  final String name;
  final String description;
  final String icon;
  final String address;
  TheaterModel({
    required this.id,
    required this.name,
    required this.description,
    required this.icon,
    required this.address,
  });

  factory TheaterModel.fromDocument(Map<String, dynamic> doc) {
    return TheaterModel(
      id: doc['id'],
      name: doc['name'],
      description: doc['description'],
      icon: doc['icon'],
      address: doc['address'],
    );
  }
}
