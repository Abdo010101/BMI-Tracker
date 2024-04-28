import 'package:bmi/cores/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefalutButton extends StatelessWidget {
  const DefalutButton({super.key, required this.title, required this.onTap});
  final String title;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 50.sp,
        decoration: BoxDecoration(
            borderRadius: BorderRadiusDirectional.circular(14),
            shape: BoxShape.rectangle,
            color: Colors.black), // const Color(0xff34A853)),
        child: Center(
          child: Text(
            title,
            style: Styles.styleSubHeader2,
          ),
        ),
      ),
    );
  }
}
