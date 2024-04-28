import 'package:bloc/bloc.dart';
import 'package:bmi/cores/di.dart';
import 'package:bmi/features/home_layout_feature/data/data_source/remote/repo/home_layout_repo.dart';
import 'package:bmi/features/home_layout_feature/domain/models/user_data_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'home_layout_state.dart';

class HomeLayoutCubit extends Cubit<HomeLayoutState> {
  HomeLayoutCubit() : super(HomeLayoutInitial());

  TextEditingController weightController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  HomeLayoutRepo homeLayoutRepo = getIt.get<HomeLayoutRepo>();
  List<UserDataModel> userListData = [];
  void getDataFromFirebaseCubit() async {
    userListData = [];
    emit(UserDataComeLoading());
    var data = await homeLayoutRepo.getDataUser();
    userListData.addAll(data!);
    if (userListData.isEmpty) {
      emit(UserDataComeError());
    }
    emit(UserDataComeSuccess(myList: userListData));
  }

  void deleteItemForUserCubit({required String documentID}) async {
    emit(UserItemDeleteLoading());
    await homeLayoutRepo.deleteItemForUser(documentID: documentID);
    emit(UserItemDeleteSuccess());
    //! do not forget to call getDataFrom
    getDataFromFirebaseCubit();
  }

  Future<void> editItemForUserCubit(
      {required String documentId,
      required String weight,
      required String height,
      required String age}) async {
    emit(UserItemUpdateLoading());
    await homeLayoutRepo.editItemForUser(
        documentId: documentId, weight: weight, height: height, age: age);
    emit(UserItemUpdateSuccess());
    getDataFromFirebaseCubit();
  }

  void signOutUsrCubit() async {
    emit(UserSignOutLoading());
    await homeLayoutRepo.signOutUser();
    emit(UserSignOutSuccess());
  }

  void clearDataFields() {
    ageController.clear();
    weightController.clear();
    heightController.clear();
  }
}
