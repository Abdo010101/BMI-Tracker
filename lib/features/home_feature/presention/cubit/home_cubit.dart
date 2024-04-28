import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bmi/cores/di.dart';
import 'package:bmi/cores/utils/app_strings.dart';
import 'package:bmi/features/home_feature/data/data_source/remote/repo/home_repo.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  TextEditingController weightController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  HomeRepo homeRepo = getIt.get<HomeRepo>();

  double bmiResutl = 0;
  String statusBmi = '';

  // this function Calucalte BMI
  Future<void> calcualteBmi() async {
    emit(HomeCalaculateBMILoading());

    final double height = double.parse(heightController.text);
    final double weight = double.parse(weightController.text);
    final double age = double.parse(ageController.text);
    bmiResutl = weight / height * height;
    statusBmi = await getStatusFromBMI(bmiResutl);

    emit(HomeCalaculateBMISuccess());
  }

  Future<void> submitData(
      {required String age,
      required String weight,
      required String height}) async {
    emit(HomeSumbitDataLoading());
    var res = await homeRepo.saveDataUser(
      age: age.toString(),
      weight: weight.toString(),
      height: height.toString(),
      bmi: bmiResutl.toString(),
      status: statusBmi,
    );
    if (res != null) {
      emit(HomeSumbitDataSuccees());
    } else {
      emit(HomeSumbitDataError());
    }
  }

  Future<String> getStatusFromBMI(double bmi) async {
    if (bmi < 18.5) return 'Underweight';
    if (bmi >= 18.5 && bmi < 24.9) return 'Normal';
    if (bmi >= 25 && bmi < 29.9) return 'Overweight';
    return 'Obese';
  }

//**   Check Validation OF TextForm FIelds  *********************************************************************************************/
  String? checkValidateWeight(String? val) {
    if (int.tryParse(val!) == 0) {
      return AppStrings.weightNotEqualToZero;
    }
    if (val.trim().isEmpty) {
      return AppStrings.weightNotEmpty;
    }
    return null;
  }

  String? checkValidateAge(String? val) {
    if (int.tryParse(val!) == 0) {
      return AppStrings.ageNotEqualToZero;
    }
    if (val.trim().isEmpty) {
      return AppStrings.ageNotEmpty;
    }
    return null;
  }

  String? checkValdiateHeight(String? val) {
    if (int.tryParse(val!) == 0) {
      return AppStrings.heightNotEqualToZero;
    }
    if (val.trim().isEmpty) {
      return AppStrings.heightNotEmpty;
    }
    return null;
  }

//******************************************************************************************************** */
}
