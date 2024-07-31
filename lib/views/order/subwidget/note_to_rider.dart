import 'package:chopnow_new_customer_app/views/common/color_extension.dart';
import 'package:chopnow_new_customer_app/views/common/custom_button.dart';
import 'package:chopnow_new_customer_app/views/common/notes.dart';
import 'package:chopnow_new_customer_app/views/common/reusable_text_widget.dart';
import 'package:chopnow_new_customer_app/views/controllers/checkout_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:heroicons_flutter/heroicons_flutter.dart';

class NoteToRider extends StatelessWidget {
  const NoteToRider({super.key});

  @override
  Widget build(BuildContext context) {
    final CheckoutController controller = Get.put(CheckoutController());
    return Container(
      height: 1000.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(50.r),
          topLeft: Radius.circular(50.r),
        ),
        color: Tcolor.White,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ReuseableText(
                  title: "Note to rider",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 32.sp,
                    color: Tcolor.Text,
                  ),
                ),
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
                        HeroiconsOutline.xMark,
                        color: Tcolor.Text,
                        size: 32.sp,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 50.h,),
            NoteToVendors(
              controller: controller.noteToRider,
            ),
            const Spacer(), // This pushes the button to the bottom
            CustomButton(
              onTap: () {},
              title: "Save note",
              showArrow: false,
              btnHeight: 96.sp,
              raduis: 80.r,
              fontSize: 28.sp,
              textColor: Tcolor.Text,
              gradient: Tcolor.Primary_button,
              boxShadow: [
                BoxShadow(
                  color: Tcolor.PRIMARY_Button_Inner_Shadow,
                  offset: const Offset(0, -1),
                  blurRadius: 1,
                  spreadRadius: 0
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
