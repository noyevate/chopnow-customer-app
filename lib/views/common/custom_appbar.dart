// ignore_for_file: unused_import

import 'package:chopnow_new_customer_app/views/common/color_extension.dart';
import 'package:chopnow_new_customer_app/views/common/reusable_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
      width: double.infinity,
      height: 150.h,
      padding: EdgeInsets.fromLTRB(24.w, 70.h, 24.w, 0),
      color: Tcolor.White,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 35.r,
                // backgroundColor: Tcolor.placeHolder,
                // Uncomment the line below if you have a valid image URL

                child: Image.asset("assets/img/bottombar_profile.png", height: 70.h, width: 70.w,),
              ),
              SizedBox(width: 10.w),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                  ReuseableText(
                    title: "Good morning, Nathaniel",
                    style: TextStyle(
                      color: Tcolor.Text,
                      fontSize: 32.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5.h,),
                  Row(
                    children: [
                      Icon(Icons.location_pin, size: 30.sp, color: Tcolor.Primary,),
                      SizedBox(width: 7.w,),
                      SizedBox(
                        width: 300.w,
                        child: ReuseableText(
                          title: "No 10, Tanke, Oke Odo Ilo, Kw.St",
                          style: TextStyle(
                            color: Tcolor.TEXT_Label,
                            fontSize: 24.sp,
                            fontWeight: FontWeight.normal,
                            overflow: TextOverflow.ellipsis
                          ),
                        ),
                      ),
                      Icon(Icons.arrow_drop_down, size: 40.sp, color: Tcolor.TEXT_Placeholder,),

                    ],
                  ),
                ],
              ),
            ],
          ),
          Text(
            getTimeOfDay(),
            style: const TextStyle(fontSize: 35),
          )
        ],
      ),
    );
  }

  String getTimeOfDay() {
    final now = DateTime.now();
    final hour = now.hour;

    if (hour >= 7 && hour < 16) {
      return '☀️'; // Between 7am and 4pm
    } else if (hour >= 16 && hour < 19) {
      return '⛅'; // Between 4pm and 7pm
    } else {
      return '🌙'; // Between 7pm and 7am
    }
  }
}
