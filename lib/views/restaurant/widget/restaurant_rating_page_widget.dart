import 'package:chopnow_new_customer_app/views/models/rating_model.dart';
import 'package:chopnow_new_customer_app/views/restaurant/rating_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:heroicons_flutter/heroicons_flutter.dart';
import 'package:chopnow_new_customer_app/views/common/color_extension.dart';
import 'package:chopnow_new_customer_app/views/common/reusable_text_widget.dart';
import 'package:chopnow_new_customer_app/views/models/restaurant_model.dart';

class RestaurantRatingPageWidget extends StatelessWidget {
  const RestaurantRatingPageWidget({super.key, required this.restaurant});

  final RestaurantModel? restaurant;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 50.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  height: 64.h,
                  width: 64.h,
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
                        HeroiconsOutline.arrowLeft,
                        color: Tcolor.Text,
                        size: 30.sp,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.w),
                  child: ReuseableText(
                    title: "Ratings",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 34.sp,
                      color: Tcolor.Text,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 40.h,),
            Padding(
              padding: EdgeInsets.only(top: 20.w),
              child: Container(
                height: 200.h,
                width: double.infinity,
                color: Tcolor.White,
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 50.w,
                        width: double.infinity,
                        child: Center(
                          child: ReuseableText(
                            title: "${restaurant!.rating.toDouble()}/5.0",
                            style: TextStyle(
                                fontSize: 50.sp,
                                color: Tcolor.Text,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                      RatingBarIndicator(
                        itemCount: 5,
                        rating: restaurant!.rating.toDouble(),
                        unratedColor: Tcolor.BACKGROUND_Dark,
                        itemSize: 80.sp,
                        itemBuilder: (context, i) => ShaderMask(
                          shaderCallback: (Rect bounds) {
                            return Tcolor.Primary_button.createShader(bounds);
                          },
                          child: Icon(
                            HeroiconsSolid.star,
                            size: 24.sp,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            
            SizedBox(height: 40.h),
            // Display the ratings list here instead of embedding RatingPage again.
            Expanded(
              child: RatingPage(restaurant: restaurant)
            )
          ],
        ),
      ),
    );
  }
}
