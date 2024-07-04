import 'package:chopnow_new_customer_app/views/common/color_extension.dart';
import 'package:chopnow_new_customer_app/views/common/reusable_text_widget.dart';
import 'package:chopnow_new_customer_app/views/common/size.dart';
import 'package:chopnow_new_customer_app/views/food/food_page.dart';
import 'package:chopnow_new_customer_app/views/models/food_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class FoodTile extends StatelessWidget {
  const FoodTile({super.key, required this.food});

  final FoodModel food;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
          () =>  FoodPage(food: food,),
          transition: Transition.fadeIn,
          duration: const Duration(milliseconds: 700),
        );
      },
      child: Stack(
        clipBehavior: Clip.hardEdge,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 8),
            height: 160.h,
            width: width,
            decoration: BoxDecoration(
                color: Tcolor.White, borderRadius: BorderRadius.circular(20.r)),
            child: Container(
              padding: EdgeInsets.all(4.r),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 10.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ReuseableText(
                          title: food.title,
                          style: TextStyle(
                              fontSize: 30.sp,
                              color: Tcolor.Text,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        SizedBox(
                          width: width / 2,
                          child: ReuseableText(
                            title: food.description,
                            style: TextStyle(
                                fontSize: 28.sp,
                                color: Tcolor.TEXT_Label,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        ReuseableText(
                          title: "\u20A6 ${food.price.toString()}",
                          style: TextStyle(
                              fontSize: 30.sp,
                              color: Tcolor.Text,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(24.r)),
                    child: Stack(
                      children: [
                        SizedBox(
                          width: 164.w,
                          height: 164.h,
                          child: Image.network(
                            food.imageUrl[0],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
