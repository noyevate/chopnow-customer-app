import 'package:chopnow_new_customer_app/views/auth/login/widget/pin_login.dart';
import 'package:chopnow_new_customer_app/views/auth/widget/field_widget.dart';
import 'package:chopnow_new_customer_app/views/common/color_extension.dart';
import 'package:chopnow_new_customer_app/views/common/custom_button.dart';
import 'package:chopnow_new_customer_app/views/common/reusable_text_widget.dart';
import 'package:chopnow_new_customer_app/views/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late LoginController controller;

  @override
  void initState() {
    super.initState();
    // Initialize the controller only once
    controller = Get.put(LoginController());
    
  }

  @override
  void dispose() {
    // Dispose the controller when the widget is removed
    Get.delete<LoginController>();
    super.dispose();
  }

  void printY(String phone) {
    
    print(phone);
  }

  @override
  Widget build(BuildContext context) {
     controller = Get.put(LoginController());
    return Scaffold(
      backgroundColor: Tcolor.White,
      body: Stack(
        children: [
          // Scrollable content
          SingleChildScrollView(
            padding: EdgeInsets.all(30.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 40.h),
                Container(
                  height: 90.h,
                  width: 90.h,
                  decoration: BoxDecoration(
                    color: Tcolor.BACKGROUND_Dark,
                    borderRadius: BorderRadius.circular(40.r),
                  ),
                  child: Center(
                    child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: Tcolor.Text,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30.h),
                ReuseableText(
                  title: "Login",
                  style: TextStyle(
                    color: Tcolor.Text,
                    fontSize: 40.sp,
                    fontWeight: FontWeight.w600,
                    wordSpacing: 2.sp,
                  ),
                ),
                SizedBox(height: 10.h),
                ReuseableText(
                  title: "Let’s get you back right into your account.",
                  style: TextStyle(
                    color: Tcolor.TEXT_Label,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                ReuseableText(
                  title: "Delivery.",
                  style: TextStyle(
                    color: Tcolor.TEXT_Label,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 30.h),

                

                // Phone Number with Nigerian map and +234
                ReuseableText(
                  title: "Phone number",
                  style: TextStyle(
                    color: Tcolor.TEXT_Body,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 10.h), // Space between the label and input

                Row(
                  children: [
                    // Fixed width FieldWidget containing SvgPicture
                    FieldWidget(
                      width: 200.w, // Adjust width to your preference
                      prefixIcon: IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          "assets/img/flag-for-flag-nigeria-svgrepo-com.svg",
                          height: 40.h,
                          width: 40.w,
                        ),
                      ),
                      hintText: "+234",
                      hintColor: Tcolor.TEXT_Label,
                      hintFontSize: 30.sp,
                      hintFontWeight: FontWeight.w600,
                      cursorHeight: 30.sp,
                      cursorColor: Tcolor.Primary,
                      enabled: false,
                    ),
                    SizedBox(width: 30.w), // Space between the text fields
                    Expanded(
                      child: FieldWidget(
                        prefixIcon: const Icon(Icons.phone),
                        hintText: "81 343 XXXX",
                        hintColor: Tcolor.TEXT_Label,
                        hintFontSize: 30.sp,
                        hintFontWeight: FontWeight.w600,
                        cursorHeight: 30.sp,
                        cursorColor: Tcolor.Primary,
                        controller: controller.phoneNumberController,
                        onChanged: (value) => controller.validateForm(),
                        keyboardType: TextInputType.phone,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),

               
                SizedBox(
                    height:
                        150.h), //reased bottom padding to avoid button overlap
              ],
            ),
          ),

          // Positioned button at the bottom
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding:
                  EdgeInsets.all(30.sp), // Padding to match the content padding
              child: Obx(() => CustomButton(
                    title: "Login",
                    showArrow: false,
                    btnColor: controller.isFormFilled.value
                        ? Tcolor.PRIMARY_Button_color_1
                        : Tcolor.PRIMARY_T4,
                    btnHeight: 96.h,
                    raduis: 50.r,
                    btnWidth: double.infinity, // Adjust width as needed
                    textColor: controller.isFormFilled.value ? Tcolor.TEXT_Label : Tcolor.Text_Secondary,
                    fontSize: 32.sp,
                    onTap: () {
                      printY(
                        
                        controller.phoneNumberController.text,
                      );
                      if (
                          controller.phoneNumberController.text.isNotEmpty) {
                            Get.to(() => const LoginPinPage(),
                          transition: Transition.leftToRight,
                          duration: const Duration(milliseconds: 10));
                          
                          controller.phoneNumberController.text = "";
                          } else{
                            Get.snackbar("Uncompleted fields", "Complete the fields",
                            backgroundColor: Tcolor.ERROR_Light_2);
                          }
                      
                    },
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
