import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  static String collectionName = 'users';
  String id;
  String name;
  String phoneNumber;
  String email;

  User({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.email,
  });

  User.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'] as String,
          name: json['name'] as String,
          phoneNumber: json['phoneNumber'] as String,
          email: json['email'] as String,
        );

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'phoneNumber': phoneNumber, 'email': email};
  }

  static CollectionReference<User> withConverter() {
    return FirebaseFirestore.instance
        .collection(collectionName)
        .withConverter<User>(
          fromFirestore: (snapshot, _) => User.fromJson(snapshot.data()!),
          toFirestore: (user, _) => user.toJson(),
        );
  }
}
