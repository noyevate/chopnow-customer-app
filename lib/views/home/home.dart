import 'package:chopnow_new_customer_app/views/common/color_extension.dart';
import 'package:chopnow_new_customer_app/views/common/custom_appbar.dart';
import 'package:chopnow_new_customer_app/views/common/reusable_text_widget.dart';
import 'package:chopnow_new_customer_app/views/home/widgets/category_list.dart';
import 'package:chopnow_new_customer_app/views/home/widgets/popular_restaurant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Hompage extends StatelessWidget {
  const Hompage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(200.h), child: const CustomAppBar()),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // SizedBox(
                    //   height: 30.h,
                    // ),
                    ReuseableText(title: "Morning starters", style: TextStyle(fontSize: 32.sp, fontWeight: FontWeight.w600,color: Tcolor.Text)),
                    SizedBox(
                      height: 20.h,
                    ),
                    const CategoryList(),
                  ],
                ),
              ),
            ),
            Divider(color: Tcolor.SECONDARY_T2, thickness: 10.h,),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    
                    ReuseableText(title: "Popular Restaurants", style: TextStyle(fontSize: 32.sp, fontWeight: FontWeight.w600,color: Tcolor.Text)),
                    // SizedBox(
                    //   height: 20.h,
                    // ),
                    const PopularRestaurant(),
                  ],
                ),
              ),
            ),
            Divider(color: Tcolor.SECONDARY_T2, thickness: 10.h,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 30.h,
                    ),
                    ReuseableText(title: "Morning starters", style: TextStyle(fontSize: 32.sp, fontWeight: FontWeight.w600,color: Tcolor.Text)),
                    SizedBox(
                      height: 30.h,
                    ),
                    const CategoryList(),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 30.h,
                    ),
                    ReuseableText(title: "Morning starters", style: TextStyle(fontSize: 32.sp, fontWeight: FontWeight.w600,color: Tcolor.Text)),
                    SizedBox(
                      height: 30.h,
                    ),
                    const CategoryList(),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 30.h,
                    ),
                    ReuseableText(title: "Morning starters", style: TextStyle(fontSize: 32.sp, fontWeight: FontWeight.w600,color: Tcolor.Text)),
                    SizedBox(
                      height: 30.h,
                    ),
                    const CategoryList(),
                  ],
                ),
              ),
            ),
            SizedBox(height: 120.h,)
          ],
        ),
      ),
    );
  }
}