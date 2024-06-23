import 'package:chopnow_new_customer_app/views/common/color_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OTPField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final void Function(String) onChanged;

  const OTPField({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90.w,
      height: 90.h,
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        textAlign: TextAlign.center,
        maxLength: 1,
        keyboardType: TextInputType.number,
        onChanged: onChanged,
        style: TextStyle(
            fontSize: 32.sp,
            color: Tcolor.TEXT_Body,
            fontWeight: FontWeight.w600),
        decoration: InputDecoration(
          fillColor: Tcolor.SECONDARY_Generic,
          counterText: '',
          contentPadding: EdgeInsets.symmetric(vertical: 15.h),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide(
              color: Tcolor.BORDER_Light
            )
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide(
              color: Tcolor.BORDER_Light
            )
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide(
              color: Tcolor.BORDER_Light
            )
          ),
        ),
      ),
    );
  }
}
