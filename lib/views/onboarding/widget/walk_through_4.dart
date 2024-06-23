import 'package:chopnow_new_customer_app/views/auth/create_account/create_account_page.dart';
import 'package:chopnow_new_customer_app/views/auth/create_account/widget/location.dart';
import 'package:chopnow_new_customer_app/views/auth/login/login_page.dart';
import 'package:chopnow_new_customer_app/views/common/color_extension.dart';
import 'package:chopnow_new_customer_app/views/common/custom_button.dart';
import 'package:chopnow_new_customer_app/views/common/reusable_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class OnboardingCompletionBottomSheet extends StatelessWidget {
  const OnboardingCompletionBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(20.sp),
        child: Container(
          height: 700.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50.r), color: Tcolor.White),
          child: Padding(
            padding: EdgeInsets.all(30.sp),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 30.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ReuseableText(
                      title: "Get started",
                      style: TextStyle(
                          fontSize: 48.sp,
                          color: Tcolor.Text,
                          fontWeight: FontWeight.w600),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: SvgPicture.asset(
                        "assets/img/cancle.svg",
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 60.h,
                ),
                CustomButton(
                  title: "Create account",
                  showArrow: false,
                  btnWidth: 1000.sp,
                  raduis: 50.r,
                  btnHeight: 100.h,
                  textColor: Tcolor.Text,
                  fontSize: 32.sp,
                  gradient: LinearGradient(
                      colors: [
                        Tcolor.PRIMARY_Button_color_1,
                        Tcolor.PRIMARY_Button_color_2
                      ],
                      begin: Alignment.topCenter,
                      end: AlignmentDirectional.bottomCenter),
                  onTap: () {
                    Get.to(() => const CreateAccount(), transition: Transition.rightToLeft, duration: const Duration(milliseconds: 700));
                  },
                ),
                SizedBox(
                  height: 55.h,
                ),
                CustomButton(
                  title: "Login",
                  showArrow: false,
                  btnWidth: double.infinity,
                  raduis: 50.r,
                  btnHeight: 100.h,
                  textColor: Tcolor.Text,
                  btnColor: Tcolor.White,
                  fontSize: 32.sp,
                  border: Border.all(color: Tcolor.BORDER_Regular),
                  onTap: () {
                    Get.to(() => const LoginPage(), transition: Transition.rightToLeft, duration: const Duration(milliseconds: 700));
                  },
                ),
                CustomButton(
                  title: "Continue as Guest",
                  showArrow: false,
                  btnWidth: double.infinity,
                  raduis: 30.r,
                  btnHeight: 100.h,
                  textColor: Tcolor.PRIMARY_S4,
                  fontSize: 32.sp,
                  btnColor: Tcolor.White,
                  onTap: () {
                    Get.off(() => const Location(), transition: Transition.fadeIn, duration: const Duration(milliseconds: 700));
                  },
                ),
                SizedBox(
                  height: 40.h,
                ),
                ReuseableText(
                  title: "By continuing you agree with ChopNow’s",
                  style: TextStyle(
                      color: Tcolor.Text,
                      fontSize: 30.sp,
                      fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
                Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                      },
                      child: ReuseableText(
                        title: "Terms of Use ",
                        style: TextStyle(
                            color: Tcolor.PRIMARY_S4,
                            fontSize: 30.sp,
                            fontWeight: FontWeight.w500),
                         textAlign: TextAlign.justify,
                      ),
                    ),
                    ReuseableText(
                      title: "and ",
                      style: TextStyle(
                          color: Tcolor.Text,
                          fontSize: 30.sp,
                          fontWeight: FontWeight.w500),
                      //textAlign: TextAlign.center,
                    ),
                    GestureDetector(
                      onTap: () {
                      },
                      child: ReuseableText(
                        title: "Privacy Policies",
                        style: TextStyle(
                            color: Tcolor.PRIMARY_S4,
                            fontSize: 30.sp,
                            fontWeight: FontWeight.w500),
                        // textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}