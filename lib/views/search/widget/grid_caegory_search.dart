import 'package:chopnow_new_customer_app/views/common/color_extension.dart';
import 'package:chopnow_new_customer_app/views/common/reusable_text_widget.dart';
import 'package:chopnow_new_customer_app/views/common/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GridCaegorySearch extends StatelessWidget {
  const GridCaegorySearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("Category Widget");
      },
      child: Container(
        margin: EdgeInsets.only(right: 30.w),
        padding: EdgeInsets.only(top: 4.h),
        width: width * 0.01,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            color: Tcolor.SECONDARY_T2),
        child: Column(
          children: [
            SizedBox(
              height: 20.h,
            ),
            SizedBox(
              height: 70.h,
              width: width / 1.5,
              child: Image.asset(
                "assets/img/checkers.png",
                fit: BoxFit.contain,
              ),
              // decoration: BoxDecoration(
              //   borderRadius: BorderRadius.circular(20.r),
              //   color: Tcolor.Primary,
              // ),
            ),
            SizedBox(
              height: 30.h,
            ),
            ReuseableText(
              title: "Category",
              style: TextStyle(
                  fontSize: 24.sp,
                  color: Tcolor.Text,
                  fontWeight: FontWeight.w400),
            )
          ],
        ),
      ),
    );
  }
}
