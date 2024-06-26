import 'package:chopnow_new_customer_app/views/common/uidata.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'sub_widgets/restaurant_widget.dart';

class PopularRestaurant extends StatelessWidget {
  const PopularRestaurant({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320.h,
      padding: EdgeInsets.only(left: 12.w, top: 10.h),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(restaurants.length, (i) {
          var restaurant = restaurants[i];
          return RestaurantWidget(image: 'assets/img/res_2.jpg', time: restaurant['time'], title: restaurant['name'], rating: restaurant['rate'], distance: "20Km",);
          

        }),
      ),
    );
  }
}
