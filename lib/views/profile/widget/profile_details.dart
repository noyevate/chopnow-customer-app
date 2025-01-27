import 'package:chopnow_new_customer_app/views/common/circle.dart';
import 'package:chopnow_new_customer_app/views/common/color_extension.dart';
import 'package:chopnow_new_customer_app/views/common/reusable_text_widget.dart';
import 'package:chopnow_new_customer_app/views/profile/widget/current_profile_pin.dart';
import 'package:chopnow_new_customer_app/views/profile/widget/name_bottomshet.dart';
import 'package:chopnow_new_customer_app/views/profile/widget/phone_profile_bottomsheet.dart';
import 'package:chopnow_new_customer_app/views/profile/widget/profile_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:heroicons_flutter/heroicons_flutter.dart';

void showCustomBottomSheet(BuildContext context, Widget content, double height) {
  showModalBottomSheet(
    backgroundColor: Tcolor.White,
    context: context,
    enableDrag: false,
    isDismissible: false,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(25.r)),
    ),
    builder: (context) => Container(
      constraints: BoxConstraints(
        maxHeight: height,
      ),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: SingleChildScrollView(
        child: content,
      ),
    ),
  );
}

class ProfileDetails extends StatelessWidget {
  const ProfileDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(10.h), 
        child: Container()
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 30.w, right: 30.w),
          child: Column(
            children: [
              Row(
                children: [
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
                  Padding(
                    padding: EdgeInsets.only(left: 30.w),
                    child: ReuseableText(
                      title: "Profile details",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 32.sp,
                        color: Tcolor.Text
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 70.h),

              GestureDetector(
                onTap: () {
                  showCustomBottomSheet(
                    context,
                    const NameProfileBottomSheet(),
                    1400.h, // Set the height for this bottom sheet
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ProfileTile(
                      title: "Nathaniel Adenuga",
                      icon: HeroiconsOutline.user,
                      onTap: () {},
                    ),
                    Icon(
                      HeroiconsOutline.pencil,
                      size: 32.sp,
                      color: Tcolor.TEXT_Label,
                    )
                  ],
                ),
              ),
              SizedBox(height: 70.h),

              GestureDetector(
                onTap: () {
                  // Show bottom sheet for editing phone number
                  showCustomBottomSheet(
                    context,
                    const PhoneProfileBottomsheet(),
                    1400.h, // Adjust the height as needed
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ProfileTile(
                      title: "081544908331",
                      icon: HeroiconsOutline.devicePhoneMobile,
                      onTap: () {},
                    ),
                    Icon(
                      HeroiconsOutline.pencil,
                      size: 32.sp,
                      color: Tcolor.TEXT_Label,
                    )
                  ],
                ),
              ),
              SizedBox(height: 70.h),

              GestureDetector(
                onTap: () {
                  // Show bottom sheet for editing email
                  // showCustomBottomSheet(
                  //   context,
                  //   EmailBottomSheet(),
                  //   300.h, // Adjust the height as needed
                  // );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ProfileTile(
                      title: "nathadenuga@gmail.com",
                      icon: HeroiconsOutline.envelope,
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              SizedBox(height: 70.h),

              GestureDetector(
                onTap: () {
                  // Show bottom sheet for editing PIN
                  showCustomBottomSheet(
                    context,
                    const CurrentProfilePin(),
                    1400.h, // Adjust the height as needed
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          HeroiconsOutline.lockClosed,
                          size: 32.sp,
                          color: Tcolor.TEXT_Label,
                        ),
                        SizedBox(width: 20.w),
                        Row(
                          children: [
                            const CustomCirclePin(),
                            SizedBox(width: 10.w),
                            const CustomCirclePin(),
                            SizedBox(width: 10.w),
                            const CustomCirclePin(),
                            SizedBox(width: 10.w),
                            const CustomCirclePin(),
                          ],
                        )
                      ],
                    ),
                    Icon(
                      HeroiconsOutline.pencil,
                      size: 32.sp,
                      color: Tcolor.TEXT_Label,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
