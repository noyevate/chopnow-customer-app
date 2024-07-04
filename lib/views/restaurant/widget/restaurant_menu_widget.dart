import 'package:chopnow_new_customer_app/views/common/size.dart';
import 'package:chopnow_new_customer_app/views/food/food_tile.dart';
import 'package:chopnow_new_customer_app/views/hooks/fetch_by_restaurant_category.dart';
import 'package:chopnow_new_customer_app/views/models/food_model.dart';
import 'package:chopnow_new_customer_app/views/shimmer/food_tile_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class RestaurantMenuWidget extends HookWidget {
  const RestaurantMenuWidget({super.key, required this.restaurantCategory,});
  

  final String restaurantCategory;
  // final FoodModel foods;

  @override
  Widget build(BuildContext context) {

    final hookResults = useFetchFoodsByRestaurantCategory(restaurantCategory);
    final List<FoodModel>? foods = hookResults.data;
    final isLoading = hookResults.isLoading;
    return Scaffold(
      body: isLoading
          ? ListView.builder(
              itemCount: 6, // Display a few shimmer tiles while loading
              itemBuilder: (context, index) => const ShimmerFoodTile(),
            )
          : foods == null || foods.isEmpty
              ? const Center(child: Text('No food items available'))
              : ListView.builder(
                  itemCount: foods.length,
                  itemBuilder: (context, index) {
                    FoodModel food = foods[index];
                    return FoodTile(food: food);
                  },
                ),
    );
  }
}