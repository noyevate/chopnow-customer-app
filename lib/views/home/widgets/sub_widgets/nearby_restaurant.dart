import 'package:chopnow_new_customer_app/views/common/color_extension.dart';
import 'package:chopnow_new_customer_app/views/common/reusable_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NearbyRestaurantWidget extends StatelessWidget {
  const NearbyRestaurantWidget({
    super.key,
    required this.image,
    required this.title,
    required this.time,
    required this.rating,
    required this.distance,
    required this.isAvailable,
  });

  final String image;
  final String title;
  final String time;
  final String rating;
  final String distance;
  final bool isAvailable;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(5),
        width: 450.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: Tcolor.White,
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20.r),
              child: Container(
                height: 190.h,
                width: double.infinity,
                child: Stack(
                  children: [
                    Image.network(
                      image,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                    if (!isAvailable)
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.black54, // Semi-transparent overlay
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: Center(
                          child: Container(
                            height: 40.h,
                            width: 150.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.r),
                              color: Tcolor.ERROR_Light_2,
                            ),
                            child: Center(
                              child: ReuseableText(
                                title: 'Closed',
                                style: TextStyle(
                                  fontSize: 32.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Tcolor.ERROR_Reg,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.only(top: 210.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ReuseableText(
                    title: title,
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w600,
                      color: Tcolor.Text,
                    ),
                  ),
                  SizedBox(
                    height: 7.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 0, right: 10.h,),
                    child: Wrap(
                      spacing: 10.w,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      runSpacing: 5.h,
                      children: [
                        ReuseableText(
                          title: time,
                          style: TextStyle(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w400,
                            color: Tcolor.TEXT_Label,
                          ),
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
                            color: Tcolor.TEXT_Label,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.topRight,
                child: Container(
                  height: 44.h,
                  width: 98.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    color: Tcolor.PRIMARY_T5,
                  ),
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
                          color: Tcolor.Text,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
