import 'package:chopnow_new_customer_app/views/auth/widget/field_widget.dart';
import 'package:chopnow_new_customer_app/views/common/color_extension.dart';
import 'package:chopnow_new_customer_app/views/common/reusable_text_widget.dart';
import 'package:chopnow_new_customer_app/views/home/home.dart';
import 'package:chopnow_new_customer_app/views/home/widgets/main_tab_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';


class Location extends StatelessWidget {
  const Location({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Tcolor.White,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 60.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ReuseableText(
                  title: "Delivery address",
                  style: TextStyle(
                      color: Tcolor.Text,
                      fontSize: 36.sp,
                      fontWeight: FontWeight.w700,
                      wordSpacing: 2.sp),
                ),
                GestureDetector(
                  onTap: () {
                    Get.offAll(() =>  HomeScreen(), transition: Transition.fadeIn, duration: const Duration(milliseconds: 700));
                  },
                  child: IconButton(
                    onPressed: null,
                    icon: SvgPicture.asset(
                      "assets/img/cancle.svg",
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            FieldWidget(
              prefixIcon: const Icon(Icons.search),
              hintText: "Enter your address",
              hintColor: Tcolor.TEXT_Placeholder,
              hintFontSize: 30.sp,
              hintFontWeight: FontWeight.w600,
              cursorHeight: 30.sp,
              cursorColor: Tcolor.Primary,
            ),
            SizedBox(
              height: 20.h,
            ),
            FieldWidget(
              prefixIcon: IconButton(
                onPressed: () {},
                icon: SvgPicture.asset("assets/img/paper_airplane_up.svg", height: 40.h, width: 40.w,),
                
              ),
              hintText: "Use my current location",
              hintColor: Tcolor.Text,
              hintFontSize: 30.sp,
              hintFontWeight: FontWeight.w400,
              cursorHeight: 30.sp,
              cursorColor: Tcolor.Primary,
              fillColor: Tcolor.PRIMARY_T5,
              enabled: false,
            ),
            SizedBox(
              height: 20.h,
            ),

            
          ],
        ),
      ),
    );
  }
}
