import 'package:chopnow_new_customer_app/views/common/color_extension.dart';
import 'package:chopnow_new_customer_app/views/common/reusable_text_widget.dart';
import 'package:chopnow_new_customer_app/views/common/size.dart';
import 'package:chopnow_new_customer_app/views/common/uidata.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.h,
      padding: EdgeInsets.only(left: 12.w, top: 10.h),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(categories.length, (i) {
          var category = categories[i];
          return GestureDetector(
            onTap: (){},
            child: Container(
              margin: EdgeInsets.only(right: 5.w),
              padding: EdgeInsets.only(top: 4.h),
              width: width * 0.19,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                color: Tcolor.SECONDARY_T2
              ),
              child: Column(
                children: [
                  SizedBox(height: 20.h,),
                  Container(
                    height: 70.h,
                    // width: width / 1.5,
                    // child: Image.asset(category["image"], fit: BoxFit.contain,),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      color: Tcolor.Primary,
                    ),
                    
                  ),
                  SizedBox(height: 30.h,),
            
                  ReuseableText(title: category['name'], style: TextStyle(fontSize: 24.sp, color: Tcolor.Text, fontWeight: FontWeight.w400),)
                 
                  
            
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}