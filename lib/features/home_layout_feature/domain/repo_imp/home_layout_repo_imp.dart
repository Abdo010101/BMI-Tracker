import 'dart:developer';

import 'package:bmi/features/home_layout_feature/data/data_source/remote/repo/home_layout_repo.dart';
import 'package:bmi/features/home_layout_feature/domain/models/user_data_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class HomeLayoutRepoImp extends HomeLayoutRepo {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  @override
  Future<List<UserDataModel>?> getDataUser() async {
    try {
      var snapshot = await _firestore
          .collection('bmiRecords')
          .orderBy('timestamp', descending: true)
          .limit(10)
          .get();

      var data = snapshot.docs.map((e) => UserDataModel.fromJson(e)).toList();
      snapshot.docs;
      return data;
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  @override
  Future<void> deleteItemForUser({required String documentID}) async {
    try {
      await _firestore.collection('bmiRecords').doc(documentID).delete();
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  Future<void> editItemForUser(
      {required String documentId,
      required String weight,
      required String height,
      required String age}) async {
    try {
      double he = double.tryParse(height)!;

      double bmi = double.tryParse(weight)! / (he * he);
      String status = _getStatusFromBMI(bmi);
      await _firestore.collection('bmiRecords').doc(documentId).update({
        'weight': weight,
        'height': height,
        'age': age,
        'bmi': bmi,
        'status': status,
        'timestamp': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      log(e.toString());
    }
  }

  String _getStatusFromBMI(double bmi) {
    if (bmi < 18.5) return 'Underweight';
    if (bmi >= 18.5 && bmi < 24.9) return 'Normal';
    if (bmi >= 25 && bmi < 29.9) return 'Overweight';
    return 'Obese';
  }
}
