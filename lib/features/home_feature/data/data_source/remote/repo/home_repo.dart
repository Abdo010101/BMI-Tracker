import 'package:cloud_firestore/cloud_firestore.dart';

abstract class HomeRepo {
  Future<DocumentReference<Map<String, dynamic>>?> saveDataUser(
      {required String weight,
      required String height,
      required String age,
      required String bmi,
      required String status});
}
