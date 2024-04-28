import 'package:bmi/cores/di.dart';
import 'package:bmi/cores/utils/app_strings.dart';
import 'package:bmi/cores/utils/navigator.dart';
import 'package:bmi/cores/utils/styles.dart';
import 'package:bmi/cores/widgets/app_progress.dart';
import 'package:bmi/features/home_feature/presention/home_screen.dart';
import 'package:bmi/features/home_layout_feature/presention/cubit/home_layout_cubit.dart';
import 'package:bmi/features/home_layout_feature/presention/widgets/custom_floating_action_button.dart';
import 'package:bmi/features/home_layout_feature/presention/widgets/custom_list_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeLayoutScreen extends StatefulWidget {
  const HomeLayoutScreen({super.key});

  @override
  State<HomeLayoutScreen> createState() => _HomeLayoutScreenState();
}

class _HomeLayoutScreenState extends State<HomeLayoutScreen> {
  late HomeLayoutCubit homeLayoutCubit;

  @override
  void initState() {
    super.initState();
    homeLayoutCubit = getIt<HomeLayoutCubit>()..getDataFromFirebaseCubit();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeLayoutCubit(),
      child: Scaffold(
        floatingActionButton:
            CustomFloatingActionButton(homeLayoutCubit: homeLayoutCubit),
        body: BlocBuilder<HomeLayoutCubit, HomeLayoutState>(
          bloc: homeLayoutCubit,
          builder: (context, state) {
            if (state is UserDataComeLoading) {
              return const AppProgress();
            } else if (state is UserDataComeSuccess) {
              return state.myList.isEmpty
                  ? Center(
                      child: Text(
                      AppStrings.noDataFound,
                      style: Styles.styleSubHeader,
                    ))
                  : Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: CutomListViewData(
                        state: state,
                        homeLayoutCubit: homeLayoutCubit,
                      ),
                    );
            } else if (state is UserDataComeError) {
              return const Text(AppStrings.dataError);
            }
            return Container();
          },
        ),
      ),
    );
  }
}
