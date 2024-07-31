import 'package:chopnow_new_customer_app/views/common/color_extension.dart';
import 'package:chopnow_new_customer_app/views/common/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoteToVendors extends StatelessWidget {
  const NoteToVendors({super.key, this.controller});

  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.h,
      width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.r),
          border: Border.all(color: Tcolor.BORDER_Light)),
      child: TextField(
        controller: controller,
        cursorColor: Tcolor.Text,
        enabled: true,
        maxLines: null,
        // textAlign: TextAlign.center,
        keyboardType: TextInputType.none,
        style: TextStyle(
          fontSize: 32.sp,
          color: Tcolor.Text,
          fontWeight: FontWeight.w600,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(left: 20.w, right: 20.w),
          hintText: "Enter Message",
          hintStyle: TextStyle(
              fontSize: 28.sp,
              fontWeight: FontWeight.w400,
              color: Tcolor.TEXT_Placeholder),
        ),
      ),
    );
  }
}
