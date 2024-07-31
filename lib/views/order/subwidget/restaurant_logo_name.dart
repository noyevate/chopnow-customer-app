import 'package:cached_network_image/cached_network_image.dart';
import 'package:chopnow_new_customer_app/views/common/color_extension.dart';
import 'package:chopnow_new_customer_app/views/common/reusable_text_widget.dart';
import 'package:chopnow_new_customer_app/views/hooks/fetch_restaurant_byId.dart';
import 'package:chopnow_new_customer_app/views/models/food_model.dart';
import 'package:chopnow_new_customer_app/views/models/single_restaurant_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RestaurantLogo_name extends HookWidget {
  const RestaurantLogo_name({
    super.key,
    this.food,
  });

  // final SingleRestaurantModel? restaurant;
  final FoodModel? food;

  @override
  Widget build(BuildContext context) {
    final hookResult = useFetchRestaurantById(food!.restaurant);
    final SingleRestaurantModel? restaurant = hookResult.data;
    final bool isLoading = hookResult.isLoading;
    final Exception? error = hookResult.error;

    return isLoading
        ? Container(
            color: Tcolor.White,
          )
        : restaurant == null
            ? Container(
                color: Tcolor.White,
                child: Center(
                    child: ReuseableText(
                  title: 'No restaurnt logo avalabe available',
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w500,
                    color: Tcolor.Text_Secondary,
                  ),
                )),
              )
            : Row(
                children: [
                  Container(
                    height: 70.h,
                    width: 70.w,
                    color: Tcolor.White,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(100.r)),
                      child: CachedNetworkImage(
                        imageUrl: restaurant.logoUrl,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  ReuseableText(
                    title: restaurant.title,
                    style: TextStyle(
                        fontSize: 28.sp,
                        fontWeight: FontWeight.w500,
                        color: Tcolor.Text),
                  )
                ],
              );
  }
}
