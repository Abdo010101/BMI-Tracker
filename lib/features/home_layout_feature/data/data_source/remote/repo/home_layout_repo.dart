import 'package:bmi/features/home_layout_feature/domain/models/user_data_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class HomeLayoutRepo {
  Future<List<UserDataModel>?> getDataUser();
  Future<void> deleteItemForUser({required String documentID});
  Future<void> editItemForUser(
      {required String documentId,
      required String weight,
      required String height,
      required String age});
}
