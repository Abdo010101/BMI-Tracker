import 'package:cloud_firestore/cloud_firestore.dart';

class UserDataModel {
  String? id;
  String? age, weight, status, height, bmi;

  UserDataModel.fromJson(DocumentSnapshot json) {
    id = json.id;
    age = json['age'] ?? "20";
    weight = json['weight'] ?? "20";
    status = json['status'] ?? "Normal";
    height = json['height'] ?? "20";
    bmi = json['bmi'] ?? "20";
  }
}
