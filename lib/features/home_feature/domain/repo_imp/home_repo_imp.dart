import 'dart:developer';

import 'package:bmi/features/home_feature/data/data_source/remote/repo/home_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeRepoImp extends HomeRepo {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  @override
  Future<DocumentReference<Map<String, dynamic>>?> saveDataUser(
      {required String weight,
      required String height,
      required String age,
      required String bmi,
      required String status}) async {
    try {
      return await _firestore.collection('bmiRecords').add({
        'weight': weight,
        'height': height,
        'age': age,
        'bmi': bmi,
        'status': status,
        'timestamp': FieldValue.serverTimestamp(),
      }).then((value) {
        log('data saved good in firabsesssssssssss');
        return value;
      });
    } catch (e) {
      log(e.toString());
      return null;
    }
  }
}
