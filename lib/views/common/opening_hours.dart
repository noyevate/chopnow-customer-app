import 'package:chopnow_new_customer_app/views/common/color_extension.dart';
import 'package:chopnow_new_customer_app/views/common/reusable_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OpeningHours extends StatelessWidget {
  const OpeningHours({super.key, required this.day, required this.time});

  final String day;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ReuseableText(
          title: day,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 30.sp,
            color: Tcolor.Text,
          ),
        ),

        Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h),
          child: ReuseableText(
            title: time,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 26.sp,
              color: Tcolor.TEXT_Placeholder,
            ),
          ),
        ),


      ],
    );
  }
}
