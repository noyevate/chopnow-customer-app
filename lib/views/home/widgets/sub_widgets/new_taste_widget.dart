import 'package:chopnow_new_customer_app/views/common/color_extension.dart';
import 'package:chopnow_new_customer_app/views/common/reusable_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewTasteWidget extends StatelessWidget {
  const NewTasteWidget({
    super.key,
    required this.image,
    required this.title,
    required this.rating,
    required this.distance, required this.restaurant,
  });

  final String image;
  final String title;
  final String rating;
  final String distance;
  final String restaurant;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Stack(
        children: [
          Container(
            // margin: EdgeInsets.only(right: 5.w),
            padding: const EdgeInsets.all(5),
            width: double.infinity,
            // height: 200.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r), color: Tcolor.White),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20.r),
                  child: Container(
                    height: 230.h,
                    width: double.infinity,
                    child: Image.asset(
                      image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                ReuseableText(
                  title: title,
                  style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w600,
                      color: Tcolor.Text),
                ),
                SizedBox(
                  height: 7.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 0, right: 10.h),
                  child: Wrap(
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 10.w, // Horizontal space between items
                    crossAxisAlignment: WrapCrossAlignment.center,
                    runSpacing: 5.h,
                    children: [
                      ReuseableText(
                        title: restaurant,
                        style: TextStyle(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w400,
                            color: Tcolor.TEXT_Label),
                      ),
                      SizedBox(
                        height: 10.w,
                      ),
                      Container(
                        width: 10.w,
                        height: 10.h,
                        decoration: BoxDecoration(
                          color: Tcolor.BORDER_Light,
                          shape: BoxShape.circle,
                        ),
                      ),
                      SizedBox(
                        height: 10.w,
                      ),
                      ReuseableText(
                        title: distance,
                        style: TextStyle(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w400,
                            color: Tcolor.TEXT_Label),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
              right: 30.w,
              top: 20.h,
              child: Container(
                height: 44.h,
                width: 90.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    color: Tcolor.PRIMARY_T5),
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Icon(
                      Icons.star_rounded,
                      size: 40.sp,
                      color: Tcolor.Primary,
                    ),
                    ReuseableText(
                      title: rating,
                      style: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w600,
                          color: Tcolor.Text),
                    )
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
