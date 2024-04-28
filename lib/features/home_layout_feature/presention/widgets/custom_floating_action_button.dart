import 'package:bmi/features/home_feature/presention/home_screen.dart';
import 'package:bmi/features/home_layout_feature/presention/cubit/home_layout_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomFloatingActionButton extends StatelessWidget {
  CustomFloatingActionButton({super.key, required this.homeLayoutCubit});
  HomeLayoutCubit homeLayoutCubit;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        backgroundColor: Colors.orange.withOpacity(0.3),
        elevation: 0,
        child: Icon(
          Icons.add,
          size: 30.h,
        ),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const HomeScreen();
          })).then((value) {
            homeLayoutCubit.getDataFromFirebaseCubit();
          });
        });
  }
}
