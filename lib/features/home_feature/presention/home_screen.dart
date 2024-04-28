import 'dart:developer';
import 'dart:ffi';

import 'package:bmi/cores/di.dart';
import 'package:bmi/cores/utils/app_strings.dart';
import 'package:bmi/cores/widgets/cutom_text_Form_filed.dart';
import 'package:bmi/cores/widgets/default_button.dart';
import 'package:bmi/features/home_feature/presention/cubit/home_cubit.dart';
import 'package:bmi/features/home_feature/presention/widgets/bmi_form_calcuation.dart';
import 'package:bmi/features/home_feature/presention/widgets/my_chart_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final HomeCubit homeCubit;
  late GlobalKey<FormState> formkey;
  late AutovalidateMode autovalidateMode;
  @override
  void initState() {
    super.initState();
    homeCubit = getIt.get<HomeCubit>();
    formkey = GlobalKey<FormState>();
    autovalidateMode = AutovalidateMode.disabled;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeCubit, HomeState>(
        bloc: homeCubit,
        builder: (context, state) {
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: bmiFormCalcuation(context, formkey, homeCubit),
              ),
            ),
          );
        },
      ),
    );
  }
}
