import 'package:chopnow_new_customer_app/views/common/color_extension.dart';
import 'package:chopnow_new_customer_app/views/common/reusable_text_widget.dart';
import 'package:chopnow_new_customer_app/views/common/size.dart';
import 'package:chopnow_new_customer_app/views/common/uidata.dart';
import 'package:chopnow_new_customer_app/views/hooks/fetch_categories.dart';
import 'package:chopnow_new_customer_app/views/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'sub_widgets/category_widget.dart';

class CategoryList extends HookWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResult = useFetchCategories();
    List<CategoryModel>? categoryList = hookResult.data;
    final isLoading = hookResult.isLoading;
    final error = hookResult.error;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      
      children: [
        ReuseableText(title: "Morning starters", style: TextStyle(fontSize: 32.sp, fontWeight: FontWeight.w600,color: Tcolor.Text)),
                  SizedBox(
                    height: 20.h,
                  ),
        Container(
          height: 200.h,
          padding: EdgeInsets.only(left: 12.w, top: 10.h),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(categoryList!.length, (i) {
              CategoryModel category = categoryList[i];
              return CategoryWidget(category: category);
            }),
          ),
        ),
      ],
    );
  }
}
