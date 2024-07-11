import 'package:chopnow_new_customer_app/views/common/color_extension.dart';
import 'package:chopnow_new_customer_app/views/common/reusable_text_widget.dart';
import 'package:chopnow_new_customer_app/views/common/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widget/grid_caegory_search.dart';

class CategorySearch extends StatelessWidget {
  const CategorySearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 40.w, right: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ReuseableText(
            title: "All categories",
            style: TextStyle(
                fontSize: 34.sp,
                fontWeight: FontWeight.w500,
                color: Tcolor.Text),
          ),
          SizedBox(height: 20.h,),
          SizedBox(
            height: height,
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 20,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4, // Number of items per row
                childAspectRatio: 1, // Adjust this ratio as needed
                crossAxisSpacing: 10.w,
                mainAxisSpacing: 15.h,
              ),
              itemBuilder: (context, index) {
                return const GridCaegorySearch();
              },
            ),
          ),
        ],
      ),
    );
  }
}
