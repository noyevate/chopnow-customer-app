import 'package:chopnow_new_customer_app/views/common/size.dart';
import 'package:chopnow_new_customer_app/views/controllers/search_controller.dart';
import 'package:chopnow_new_customer_app/views/food/food_tile.dart';
import 'package:chopnow_new_customer_app/views/models/food_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SearchResults extends StatelessWidget {
  const SearchResults({super.key});
  

  @override
  Widget build(BuildContext context) {
    
    final controller = Get.put(SearchRestaurantFoodController());
    print(controller.foodSearch);
    return Container(
      height: height,
      padding: EdgeInsets.only(left: 30.w, right: 30.w),
      child: ListView.builder(
        itemCount: controller.foodSearch!.length,
        itemBuilder: (context, i) {
          FoodModel food = controller.foodSearch![i];
          return FoodTile(food: food);
        },
      ),
    );
  }
}