import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:playspot/core/utils/app_Colors.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    required this.textInputType,
    this.onSaved,
    this.controller,
    this.obscureText = false,
    this.validator,
  });

  final String hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType textInputType;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextFormField(
          controller: controller,
          obscureText: obscureText,
          keyboardType: textInputType,
          onSaved: onSaved,
          validator:
              validator ??
              (value) {
                if (value == null || value.isEmpty) {
                  return 'This field cannot be empty';
                }
                return null;
              },
          decoration: InputDecoration(
            fillColor: AppColors.primaryColor,
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.black54, fontSize: 14.sp),
            prefixIcon: prefixIcon,
            prefixIconColor: Colors.black54,
            suffixIcon: suffixIcon,
            border: OutlineInputBorder(
              borderSide: BorderSide(width: 1),
              borderRadius: BorderRadius.circular(14),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1),
              borderRadius: BorderRadius.circular(14),
            ),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1),
                borderRadius: BorderRadius.circular(14),
        ),
          ),        ),
      ],
    );
  }
}
