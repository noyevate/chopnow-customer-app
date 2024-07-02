import 'package:chopnow_new_customer_app/views/common/color_extension.dart';
import 'package:chopnow_new_customer_app/views/common/reusable_text_widget.dart';
import 'package:chopnow_new_customer_app/views/common/uidata.dart';
import 'package:chopnow_new_customer_app/views/home/widgets/sub_widgets/new_taste_widget.dart';
import 'package:chopnow_new_customer_app/views/hooks/fetch_all_food.dart';
import 'package:chopnow_new_customer_app/views/models/food_model.dart';
import 'package:chopnow_new_customer_app/views/shimmer/restaurant_shimer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewVenture extends HookWidget {
  const NewVenture({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final hookResult = useFetchAllFoods("0987654321");
    final List<FoodModel>? foodList = hookResult.data;
    final bool isLoading = hookResult.isLoading;
    final Exception? error = hookResult.error;


    return isLoading ? const NearbyRestaurantShimmerWidget() : Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ReuseableText(
          title: "Venture into New Tastes",
          style: TextStyle(
              fontSize: 32.sp,
              fontWeight: FontWeight.w600,
              color: Tcolor.Text),
        ),
        Column(
          children: List.generate(foodList!.length, (i) {
            FoodModel food = foodList[i];
            return NewTasteWidget(
              food: food, 
            );
          }),
        ),
      ],
    );
  }
}
