class userModel {
  final String id;
  final String email;
  final String fullName;
  final String userName;
  final String phoneNumber;
  final String avatar;
  final List favoriteList;
  final List saveList;
  final String role;
  final String gender;
  final String dob;

  userModel(
      {required this.id,
      required this.email,
      required this.fullName,
      required this.userName,
      required this.phoneNumber,
      required this.avatar,
      required this.favoriteList,
      required this.saveList,
      required this.role,
      required this.gender,
      required this.dob});

  factory userModel.fromDocument(Map<String, dynamic> doc) {
    return userModel(
        avatar: doc['avatar'],
        email: doc['email'],
        favoriteList: doc['favoriteList'],
        fullName: doc['fullName'],
        phoneNumber: doc['phonenumber'],
        saveList: doc['saveList'],
        id: doc['id'],
        userName: doc['username'],
        role: doc['role'],
        gender: doc['gender'],
        dob: doc['dob']);
  }
}
