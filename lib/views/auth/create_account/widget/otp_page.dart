import 'package:chopnow_new_customer_app/views/common/color_extension.dart';
import 'package:chopnow_new_customer_app/views/common/reusable_text_widget.dart';
import 'package:chopnow_new_customer_app/views/controllers/create_account_controller.dart';
import 'package:chopnow_new_customer_app/views/controllers/otp_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:heroicons_flutter/heroicons_flutter.dart';

import '../../../common/o_t_p_field.dart';

class OTPPage extends StatelessWidget {
  const OTPPage({super.key});

  @override
  Widget build(BuildContext context) {
    final OtpController controller = Get.put(OtpController());
    final CreateAccountController accountController = Get.put(CreateAccountController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(30.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40.h),
            Container(
              height: 80.h,
              width: 80.h,
              decoration: BoxDecoration(
                color: Tcolor.BACKGROUND_Dark,
                borderRadius: BorderRadius.circular(40.r),
              ),
              child: Center(
                child: IconButton(
                  onPressed: () {
                    Get.back();
                    accountController.emailController.text = "";
                    accountController.phoneNumberController.text = "";
                    accountController.firstNameController.text = "";
                    accountController.lastNameController.text = "";


                  },
                  icon: Icon(
                    HeroiconsOutline.arrowLeft,
                    color: Tcolor.Text,
                    size: 32.sp,
                  ),
                ),
              ),
            ),
            SizedBox(height: 30.h),
            ReuseableText(
              title: "Enter OTP",
              style: TextStyle(
                fontSize: 40.sp,
                fontWeight: FontWeight.w600,
                color: Tcolor.Text,
              ),
            ),
            SizedBox(height: 10.h),
            ReuseableText(
              title: "Enter the 6-digit code sent to 080***321 to verify your.",
              style: TextStyle(
                fontSize: 24.sp,
                color: Tcolor.TEXT_Label,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 50.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                OTPField(
                  controller: controller.otp1Controller,
                  focusNode: controller.focusNodes[0],
                  onChanged: (value) => controller.handleOTPInput(value, 0),
                ),
                SizedBox(width: 20.w), // Custom space between fields
                OTPField(
                  controller: controller.otp2Controller,
                  focusNode: controller.focusNodes[1],
                  onChanged: (value) => controller.handleOTPInput(value, 1),
                ),
                SizedBox(width: 20.w), // Custom space between fields
                OTPField(
                  controller: controller.otp3Controller,
                  focusNode: controller.focusNodes[2],
                  onChanged: (value) => controller.handleOTPInput(value, 2),
                ),
                SizedBox(width: 20.w), // Custom space between fields
                OTPField(
                  controller: controller.otp4Controller,
                  focusNode: controller.focusNodes[3],
                  onChanged: (value) => controller.handleOTPInput(value, 3),
                ),
                SizedBox(width: 20.w), // Custom space between fields
                OTPField(
                  controller: controller.otp5Controller,
                  focusNode: controller.focusNodes[4],
                  onChanged: (value) => controller.handleOTPInput(value, 4),
                ),
                SizedBox(width: 20.w), // Custom space between fields
                OTPField(
                  controller: controller.otp6Controller,
                  focusNode: controller.focusNodes[5],
                  onChanged: (value) => controller.handleOTPInput(value, 5),
                ),
              ],
            ),
            const Spacer(), // Pushes the resend text to the bottom
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: 50.h), // Adjust padding as needed
                child: Obx(() => TextButton(
                  onPressed: controller.canResend.value ? controller.resendCode : null,
                  child: ReuseableText(
                    title: controller.canResend.value ? "Resend code" : "Resend code in ${controller.countdown.value} secs",
                    style: TextStyle(
                      color: controller.canResend.value ? Tcolor.PRIMARY_Button_color_1 : Tcolor.TEXT_Label,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                )),
              ),
            ),
            SizedBox(height: 30.h), // Space from the bottom
          ],
        ),
      ),
    );
  }
}
