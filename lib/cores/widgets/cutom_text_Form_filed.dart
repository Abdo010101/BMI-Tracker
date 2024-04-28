import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomeTextFiled extends StatelessWidget {
  final TextEditingController textEditingController;
  double? width;
  double? heigh;
  String? hinText;
  AutovalidateMode? autovalidateMode;
  String? Function(String?)? validator;
  TextInputType? textInputType;
  void Function(String)? onChanged;
  CustomeTextFiled(
      {super.key,
      this.validator,
      this.autovalidateMode,
      this.onChanged,
      required this.textEditingController,
      this.hinText,
      this.textInputType,
      this.width,
      this.heigh});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: heigh ?? 80,
      child: TextFormField(
          autovalidateMode: autovalidateMode,
          onChanged: onChanged,
          validator: validator,
          keyboardType: textInputType ?? TextInputType.text,
          controller: textEditingController,
          decoration: InputDecoration(
              hintText: hinText ?? 'Search here',
              fillColor: Colors.transparent,
              filled: true,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
              border: buildBorderSide(),
              enabledBorder: buildBorderSide(),
              focusedBorder: buildBorderSide())),
    );
  }

  OutlineInputBorder buildBorderSide() {
    return OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(9)),
        borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)));
  }
}
