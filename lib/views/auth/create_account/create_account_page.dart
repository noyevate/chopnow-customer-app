import 'package:chopnow_new_customer_app/views/auth/create_account/widget/otp_page.dart';
import 'package:chopnow_new_customer_app/views/auth/widget/field_widget.dart';
import 'package:chopnow_new_customer_app/views/common/color_extension.dart';
import 'package:chopnow_new_customer_app/views/common/custom_button.dart';
import 'package:chopnow_new_customer_app/views/common/reusable_text_widget.dart';
import 'package:chopnow_new_customer_app/views/controllers/create_account_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:heroicons_flutter/heroicons_flutter.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  late CreateAccountController controller;

  @override
  void initState() {
    super.initState();
    // Initialize the controller only once
    controller = Get.put(CreateAccountController());
    
  }

  @override
  void dispose() {
    // Dispose the controller when the widget is removed
    Get.delete<CreateAccountController>();
    super.dispose();
  }

  void printY(String first, String last, String email, String phone) {
    print(first);
    print(last);
    print(email);
    print(phone);
  }

  @override
  Widget build(BuildContext context) {
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
                  height: 70.h,
                  width: 70.w,
                  decoration: BoxDecoration(
                    color: Tcolor.BACKGROUND_Dark,
                    borderRadius: BorderRadius.circular(60.r),
                  ),
                  child: Center(
                    child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(
                        HeroiconsOutline.arrowLeft,
                        color: Tcolor.Text,
                        size: 24.sp,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30.h),
                ReuseableText(
                  title: "Create your account",
                  style: TextStyle(
                    color: Tcolor.Text,
                    fontSize: 40.sp,
                    fontWeight: FontWeight.w600,
                    wordSpacing: 2.sp,
                  ),
                ),
                SizedBox(height: 10.h),
                ReuseableText(
                  title: "Get Choppin' with ChopNow! Sign Up for Fast & Easy",
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

                // Row for First Name and Last Name labels
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: ReuseableText(
                        title: "First Name",
                        style: TextStyle(
                          color: Tcolor.TEXT_Body,
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(width: 10.w), // Add spacing between the labels
                    Expanded(
                      child: ReuseableText(
                        title: "Last Name",
                        style: TextStyle(
                          color: Tcolor.TEXT_Body,
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h), // Adjust this height to your preference

                // Row for First Name and Last Name text fields
                Row(
                  children: [
                    Expanded(
                      child: FieldWidget(
                        prefixIcon: const Icon(HeroiconsOutline.user),
                        hintText: "e.g john",
                        hintColor: Tcolor.TEXT_Placeholder,
                        hintFontSize: 30.sp,
                        hintFontWeight: FontWeight.w600,
                        cursorHeight: 30.sp,
                        cursorColor: Tcolor.Primary,
                        controller: controller.firstNameController,
                        onChanged: (value) => controller.validateForm(),
                      ),
                    ),
                    SizedBox(width: 30.w), // Space between the text fields
                    Expanded(
                      child: FieldWidget(
                        prefixIcon: const Icon(HeroiconsOutline.user),
                        hintText: "e.g Adewale",
                        hintColor: Tcolor.TEXT_Placeholder,
                        hintFontSize: 30.sp,
                        hintFontWeight: FontWeight.w600,
                        cursorHeight: 30.sp,
                        cursorColor: Tcolor.Primary,
                        controller: controller.lastNameController,
                        onChanged: (value) => controller.validateForm(),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h), // Adjust the spacing between rows

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
                      hintColor: Tcolor.TEXT_Placeholder,
                      hintFontSize: 30.sp,
                      hintFontWeight: FontWeight.w600,
                      cursorHeight: 30.sp,
                      cursorColor: Tcolor.Primary,
                      enabled: false,
                    ),
                    SizedBox(width: 30.w), // Space between the text fields
                    Expanded(
                      child: FieldWidget(
                        prefixIcon: Container(
                          height: 10.h,
                          width: 0.w,
                        ),
                        hintText: "81 343 XXXX",
                        hintColor: Tcolor.TEXT_Placeholder,
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

                // Email Address
                ReuseableText(
                  title: "Email Address",
                  style: TextStyle(
                    color: Tcolor.TEXT_Body,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 10.h), // Space between the label and input
                FieldWidget(
                  prefixIcon: const Icon(Icons.email_outlined),
                  hintText: "e.g Adewalejohn2example.com",
                  hintColor: Tcolor.TEXT_Placeholder,
                  hintFontSize: 30.sp,
                  hintFontWeight: FontWeight.w600,
                  cursorHeight: 30.sp,
                  cursorColor: Tcolor.Primary,
                  controller: controller.emailController,
                  onChanged: (value) => controller.validateForm(),
                ),
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
                    title: "Sign up",
                    showArrow: false,
                    btnColor: controller.isFormFilled.value
                        ? Tcolor.PRIMARY_Button_color_1
                        : Tcolor.PRIMARY_T4,
                    btnHeight: 96.h,
                    raduis: 50.r,
                    btnWidth: 10000.w, // Adjust width as needed
                    textColor: controller.isFormFilled.value ? Tcolor.Text_Secondary : Tcolor.TEXT_Label,
                    fontSize: 32.sp,
                    onTap: () {
                      printY(
                        controller.firstNameController.text,
                        controller.lastNameController.text,
                        controller.emailController.text,
                        controller.phoneNumberController.text,
                      );
                      if (controller.firstNameController.text.isNotEmpty &&
                          controller.lastNameController.text.isNotEmpty &&
                          controller.emailController.text.isNotEmpty &&
                          controller.phoneNumberController.text.isNotEmpty) {
                            Get.to(() => const OTPPage(),
                          transition: Transition.leftToRight,
                          duration: const Duration(milliseconds: 10));
                          controller.firstNameController.text = "";
                          controller.lastNameController.text = "";
                          controller.emailController.text = "";
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
