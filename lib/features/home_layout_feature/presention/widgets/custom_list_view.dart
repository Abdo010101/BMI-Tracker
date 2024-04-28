import 'package:bmi/cores/di.dart';
import 'package:bmi/cores/utils/app_strings.dart';
import 'package:bmi/cores/utils/styles.dart';
import 'package:bmi/cores/widgets/cutom_text_Form_filed.dart';
import 'package:bmi/cores/widgets/default_button.dart';
import 'package:bmi/features/home_feature/presention/cubit/home_cubit.dart';
import 'package:bmi/features/home_layout_feature/presention/cubit/home_layout_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CutomListViewData extends StatefulWidget {
  CutomListViewData(
      {super.key, required this.state, required this.homeLayoutCubit});

  UserDataComeSuccess state;
  HomeLayoutCubit homeLayoutCubit;

  @override
  State<CutomListViewData> createState() => _CutomListViewDataState();
}

class _CutomListViewDataState extends State<CutomListViewData> {
  AutovalidateMode? autovalidateMode;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    autovalidateMode = AutovalidateMode.disabled;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.state.myList.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Container(
            decoration: ShapeDecoration(
                color: Colors.orange.withOpacity(0.3),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20))),
            child: ListTile(
              title: Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 12),
                child: Text(
                  'BMI: ${widget.state.myList[index].bmi}',
                  style: Styles.style20,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 3.h,
                  ),
                  Text(
                    'Weight: ${widget.state.myList[index].weight} kg',
                    style: Styles.style12,
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Text(
                    'Height: ${widget.state.myList[index].height} cm ',
                    style: Styles.style12,
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Text(
                    'Status: ${widget.state.myList[index].status}',
                    style: Styles.style12,
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                ],
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return CustomBottomSheet(
                              formKey: formkey,
                              autovalidateMode: autovalidateMode!,
                              state: widget.state,
                              index: index,
                            );
                          });
                    },
                  ),
                  IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        widget.homeLayoutCubit.deleteItemForUserCubit(
                            documentID: widget.state.myList[index].id!);
                      }),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class CustomBottomSheet extends StatelessWidget {
  CustomBottomSheet(
      {super.key,
      required this.formKey,
      required this.autovalidateMode,
      required this.state,
      required this.index});
  GlobalKey<FormState> formKey;
  AutovalidateMode autovalidateMode;
  UserDataComeSuccess state;
  int index;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
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
                  textEditingController:
                      getIt.get<HomeCubit>().heightController,
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
                  textEditingController:
                      getIt.get<HomeCubit>().weightController,
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
                  textEditingController: getIt.get<HomeCubit>().ageController,
                  hinText: AppStrings.hintTextAge,
                  validator: (String? val) {
                    return getIt.get<HomeCubit>().checkValidateAge(val);
                  },
                ),
                SizedBox(
                  height: 20.h,
                ),
                DefalutButton(
                    title: "Edit",
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        //   await getIt.get<HomeCubit>().calcualteBmi();

                        //TODO here we will reaplace the new fnction s
                        getIt.get<HomeLayoutCubit>().editItemForUserCubit(
                            documentId: state.myList[index].id!,
                            age: getIt
                                .get<HomeCubit>()
                                .ageController
                                .text
                                .toString(),
                            weight: getIt
                                .get<HomeCubit>()
                                .weightController
                                .text
                                .toString(),
                            height: getIt
                                .get<HomeCubit>()
                                .heightController
                                .text
                                .toString());
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
        ));
  }
}
