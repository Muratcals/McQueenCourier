import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AtomicTextFormField extends TextFormField {
  AtomicTextFormField(
      {super.key,
      super.onSaved,
      required String title,
      super.controller,
      IconData? prefixIcon,
      super.keyboardType,
      super.maxLength,
      super.enabled,
      required super.validator,
      super.inputFormatters,
      super.obscureText = false})
      : super(
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
            contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
            labelText: title,
            labelStyle: TextStyle(
                color: Colors.black, fontFamily: "Arial", fontSize: 13.sp),
            errorStyle: const TextStyle(color: Colors.red),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.r),
            ),
          ),
        );
}
