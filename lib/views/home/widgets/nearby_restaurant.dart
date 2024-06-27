import 'package:chopnow_new_customer_app/views/common/color_extension.dart';
import 'package:chopnow_new_customer_app/views/common/reusable_text_widget.dart';
import 'package:chopnow_new_customer_app/views/common/uidata.dart';
import 'package:chopnow_new_customer_app/views/home/widgets/sub_widgets/nearby_restaurant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class NearbyRestaurant extends StatelessWidget {
  const NearbyRestaurant({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ReuseableText(
          title: "Nearby Restaurants",
          style: TextStyle(
              fontSize: 32.sp, fontWeight: FontWeight.w600, color: Tcolor.Text),
        ),
        SizedBox(height: 10.h,),
        Container(
          height: 300.h,
          // padding: EdgeInsets.only(left: 12.w, top: 10.h),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(restaurants.length, (i) {
              var restaurant = restaurants[i];
              return NearbyRestaurantWidget(
                image: 'assets/img/res_3.jpg',
                time: restaurant['time'],
                title: restaurant['name'],
                rating: restaurant['rate'],
                distance: "20Km", isAvailabe: restaurant['isAvailable'],
              );
            }),
          ),
        ),
      ],
    );
  }
}
