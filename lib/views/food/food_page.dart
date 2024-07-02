import 'package:cached_network_image/cached_network_image.dart';
import 'package:chopnow_new_customer_app/views/common/color_extension.dart';
import 'package:chopnow_new_customer_app/views/common/reusable_text_widget.dart';
import 'package:chopnow_new_customer_app/views/common/size.dart';
import 'package:chopnow_new_customer_app/views/models/food_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FoodPage extends StatefulWidget {
  const FoodPage({super.key, this.food});

  final FoodModel? food;

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1000.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(60.r), topRight: Radius.circular(60.r)),
          color: Tcolor.White),
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(60.r),
                topRight: Radius.circular(60.r)),
            child: Stack(
              children: [
                SizedBox(
                  height: 400.h,
                  width: double.infinity,
                  child: PageView.builder(
                    itemCount: widget.food!.imageUrl.length,
                    itemBuilder: (context, i) {
                      return Container(
                        width: width,
                        height: 400.h,
                        color: Tcolor.White,
                        child: CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl: widget.food!.imageUrl[i],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),

          // Align(
          //         alignment: Alignment.topLeft,
          //         child: Row(
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           children: List.generate(widget.food!.imageUrl.length,
          //           (index) {
          //             return Container(
          //               margin: EdgeInsets.all(4.h),
          //               width: 10.w,
          //               height: 10.h,
          //               decoration: BoxDecoration(
          //                 shape: BoxShape.circle, color: Tcolor.Primary
          //               ),
          //             );
          //           })

          //         ),
          //       )

          SizedBox(height: 10.h),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ReuseableText(
                    title: widget.food!.title,
                    style: TextStyle(
                        color: Tcolor.Text,
                        fontWeight: FontWeight.w500,
                        fontSize: 36.sp,
                        decoration: TextDecoration.none),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  ReuseableText(
                    title: "\u20A6 ${widget.food!.price.toString()}",
                    style: TextStyle(
                        color: Tcolor.Text,
                        fontWeight: FontWeight.w400,
                        fontSize: 28.sp,
                        decoration: TextDecoration.none),
                  ),
                  // ₦2,000
                  SizedBox(
                    height: 15.h,
                  ),
                  ReuseableText(
                    title: widget.food!.description,
                    style: TextStyle(
                        color: Tcolor.TEXT_Label,
                        fontWeight: FontWeight.w400,
                        fontSize: 28.sp,
                        decoration: TextDecoration.none),
                  ),
                  SizedBox(height: 10.h),

                  Divider(
                    thickness: 2.w,
                    color: Tcolor.BORDER_Light,
                  ),
                  SizedBox(height: 10.h),

                  ReuseableText(
                    title: "MAIN",
                    
                    style: TextStyle(
                        fontSize: 28.sp,
                        fontWeight: FontWeight.w500,
                        color: Tcolor.TEXT_Label,
                        decoration: TextDecoration.none
                        ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ReuseableText(
                    title: "Required",
                    
                    style: TextStyle(
                        fontSize: 28.sp,
                        fontWeight: FontWeight.w500,
                        color: Tcolor.ERROR_Reg,
                        ),
                  ),

                  ReuseableText(
                    title: "Add up to 5",
                    
                    style: TextStyle(
                        fontSize: 28.sp,
                        fontWeight: FontWeight.w500,
                        color: Tcolor.TEXT_Label,
                        ),
                  ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
