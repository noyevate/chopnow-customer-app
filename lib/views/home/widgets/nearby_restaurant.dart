import 'package:chopnow_new_customer_app/views/common/color_extension.dart';
import 'package:chopnow_new_customer_app/views/common/reusable_text_widget.dart';
import 'package:chopnow_new_customer_app/views/home/widgets/sub_widgets/nearby_restaurant.dart';
import 'package:chopnow_new_customer_app/views/hooks/fetch_resaurant.dart';
import 'package:chopnow_new_customer_app/views/models/restaurant_model.dart';
import 'package:chopnow_new_customer_app/views/shimmer/restaurant_shimer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class NearbyRestaurant extends HookWidget {
  const NearbyRestaurant({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResult = useFetchRestaurants("0987654321");
    final List<RestaurantModel>? restaurantList = hookResult.data;
    final bool isLoading = hookResult.isLoading;
    final Exception? error = hookResult.error;
    return isLoading ? const NearbyRestaurantShimmerWidget() : Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ReuseableText(
          title: "Nearby Restaurants",
          style: TextStyle(
              fontSize: 32.sp, fontWeight: FontWeight.w600, color: Tcolor.Text),
        ),
        SizedBox(height: 20.h,),
        SizedBox(
          height: 310.h,
          // padding: EdgeInsets.only(left: 12.w, top: 10.h),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(restaurantList!.length, (i) {
              RestaurantModel restaurant = restaurantList[i];
              return NearbyRestaurantWidget(restaurant: restaurant,
                
              );
            }),
          ),
        ),
      ],
    );
  }
}
