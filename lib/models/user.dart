import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String name, profileImage, email, uid;
  bool isAdmin, isBlocked;

  UserModel({
    required this.name,
    required this.profileImage,
    required this.email,
    required this.uid,
    this.isAdmin = false,
    this.isBlocked = false,
  });

  Map<String, dynamic> toJson() => {
        "name": name,
        "profileImage": profileImage,
        "email": email,
        "uid": uid,
        "isAdmin": isAdmin,
        "isBlocked": isBlocked,
      };
  static UserModel fromSnap(DocumentSnapshot snapshot) {
    var snap = snapshot.data() as Map<String, dynamic>;
    return UserModel(
      name: snap['name'],
      profileImage: snap['profileImage'],
      email: snap['email'],
      uid: snap['uid'],
      isAdmin: snap['isAdmin'],
      isBlocked: snap['isBlocked'],
    );
  }
}
