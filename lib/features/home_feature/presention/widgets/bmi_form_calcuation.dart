import 'package:bmi/cores/utils/app_strings.dart';
import 'package:bmi/cores/widgets/cutom_text_Form_filed.dart';
import 'package:bmi/cores/widgets/default_button.dart';
import 'package:bmi/features/home_feature/presention/cubit/home_cubit.dart';
import 'package:bmi/features/home_feature/presention/widgets/my_chart_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget bmiFormCalcuation(
    BuildContext context, GlobalKey<FormState> formkey, HomeCubit homeCubit) {
  var autovalidateMode;
  return Form(
    key: formkey,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomeTextFiled(
          autovalidateMode: autovalidateMode,
          textInputType: TextInputType.number,
          textEditingController: homeCubit.heightController,
          hinText: AppStrings.hintTextHeight,
          validator: (String? val) {
            return homeCubit.checkValdiateHeight(val);
          },
        ),
        SizedBox(
          height: 10.h,
        ),
        CustomeTextFiled(
          autovalidateMode: autovalidateMode,
          textInputType: TextInputType.number,
          textEditingController: homeCubit.weightController,
          hinText: AppStrings.hintTextWeightt,
          validator: (String? val) {
            return homeCubit.checkValidateWeight(val);
          },
        ),
        SizedBox(
          height: 10.h,
        ),
        CustomeTextFiled(
          autovalidateMode: autovalidateMode,
          textInputType: TextInputType.number,
          textEditingController: homeCubit.ageController,
          hinText: AppStrings.hintTextAge,
          validator: (String? val) {
            return homeCubit.checkValidateAge(val);
          },
        ),
        SizedBox(
          height: 20.h,
        ),
        DefalutButton(
            title: AppStrings.calculateBmi,
            onTap: () async {
              if (formkey.currentState!.validate()) {
                await homeCubit.calcualteBmi();
                await homeCubit.submitData(
                    age: homeCubit.ageController.text.toString(),
                    weight: homeCubit.weightController.text.toString(),
                    height: homeCubit.heightController.text.toString());
              } else {
                autovalidateMode = AutovalidateMode.always;
              }
            }),
        SizedBox(
          height: 50.h,
        ),
        BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return state is HomeCalaculateBMISuccess
                ? const CircularProgressIndicator()
                : Offstage(
                    offstage: homeCubit.bmiResutl == 0,
                    child: SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.4,
                        width: MediaQuery.sizeOf(context).width,
                        child: MyChart(
                          homeCubit: homeCubit,
                        )),
                  );
          },
        ),
      ],
    ),
  );
}
