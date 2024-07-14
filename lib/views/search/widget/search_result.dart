import 'package:chopnow_new_customer_app/views/common/color_extension.dart';
import 'package:chopnow_new_customer_app/views/common/reusable_text_widget.dart';
import 'package:chopnow_new_customer_app/views/common/size.dart';
import 'package:chopnow_new_customer_app/views/food/food_tile.dart';
import 'package:chopnow_new_customer_app/views/models/food_model.dart';
import 'package:chopnow_new_customer_app/views/models/restaurant_model.dart';
import 'package:chopnow_new_customer_app/views/restaurant/resturant_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FoodRestaurantSearchResult extends StatelessWidget {
  const FoodRestaurantSearchResult({
    super.key,
    required this.foodResults,
    required this.restaurantResults,
    required this.text,
  });

  final List<FoodModel> foodResults;
  final List<RestaurantModel> restaurantResults;
  final String text;

  @override
  Widget build(BuildContext context) {
    final results = [...foodResults, ...restaurantResults];
    return Container(
      height: height,
      color: Tcolor.BACKGROUND_Regaular,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 20.h),
            child: ReuseableText(
              title: '${results.length} results for "$text"',
              style: TextStyle(
                fontSize: 26.sp,
                fontWeight: FontWeight.w500,
                color: Tcolor.Text,
              ),
            ),
          ),
          SizedBox(height: 10.h),
          Expanded(
            child: ListView.builder(
              itemCount: results.length,
              itemBuilder: (context, i) {
                if (i < foodResults.length) {
                  final food = foodResults[i];
                  return FoodTile(food: food);
                } else {
                  final restaurant = restaurantResults[i - foodResults.length];
                  return RestaurntTile(restaurant: restaurant);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
