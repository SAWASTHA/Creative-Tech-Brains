import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? id;
  final String? name;
  final String? email;
  final String? number;
  final String? Address;

  const UserModel(
      {this.id,
      required this.email,
      required this.name,
      required this.number,
      required this.Address});

  toJson() {
    return {"Name": name, "Email": email, "Address": Address,"Number":number};
  }

  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return UserModel(
      id: document.id,
      email: data["Email"],
      name: data["Name"],
      number: data["Number"],
      Address: data["Address"],
    );
  }
}
