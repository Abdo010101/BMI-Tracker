import 'package:bmi/cores/di.dart';
import 'package:bmi/cores/utils/app_strings.dart';
import 'package:bmi/cores/widgets/cutom_text_Form_filed.dart';
import 'package:bmi/cores/widgets/default_button.dart';
import 'package:bmi/features/home_feature/presention/cubit/home_cubit.dart';
import 'package:bmi/features/home_layout_feature/presention/cubit/home_layout_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBottomSheet extends StatelessWidget {
  CustomBottomSheet(
      {super.key,
      required this.formKey,
      required this.autovalidateMode,
      required this.state,
      this.homeLayoutCubit,
      required this.index});
  GlobalKey<FormState> formKey;
  AutovalidateMode autovalidateMode;
  UserDataComeSuccess state;
  int index;
  HomeLayoutCubit? homeLayoutCubit;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
          width: double.infinity,
          height: MediaQuery.sizeOf(context).height,
          child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomeTextFiled(
                    autovalidateMode: autovalidateMode,
                    textInputType: TextInputType.number,
                    textEditingController: homeLayoutCubit!.heightController,
                    hinText: AppStrings.hintTextHeight,
                    validator: (String? val) {
                      return getIt.get<HomeCubit>().checkValdiateHeight(val);
                    },
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  CustomeTextFiled(
                    autovalidateMode: autovalidateMode,
                    textInputType: TextInputType.number,
                    textEditingController: homeLayoutCubit!.weightController,
                    hinText: AppStrings.hintTextWeightt,
                    validator: (String? val) {
                      return getIt.get<HomeCubit>().checkValidateWeight(val);
                    },
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  CustomeTextFiled(
                    autovalidateMode: autovalidateMode,
                    textInputType: TextInputType.number,
                    textEditingController: homeLayoutCubit!.ageController,
                    hinText: AppStrings.hintTextAge,
                    validator: (String? val) {
                      return getIt.get<HomeCubit>().checkValidateAge(val);
                    },
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  DefalutButton(
                      title: AppStrings.editButton,
                      onTap: () async {
                        if (formKey.currentState!.validate()) {
                          await homeLayoutCubit!.editItemForUserCubit(
                              documentId: state.myList[index].id!,
                              age: homeLayoutCubit!.ageController.text
                                  .toString(),
                              weight: homeLayoutCubit!.weightController.text
                                  .toString(),
                              height: homeLayoutCubit!.heightController.text
                                  .toString());
                          Navigator.pop(context);
                        } else {
                          autovalidateMode = AutovalidateMode.always;
                        }
                      }),
                  SizedBox(
                    height: 50.h,
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
