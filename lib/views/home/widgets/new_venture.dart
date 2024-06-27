import 'package:chopnow_new_customer_app/views/common/color_extension.dart';
import 'package:chopnow_new_customer_app/views/common/reusable_text_widget.dart';
import 'package:chopnow_new_customer_app/views/common/uidata.dart';
import 'package:chopnow_new_customer_app/views/home/widgets/sub_widgets/new_taste_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewVenture extends StatelessWidget {
  const NewVenture({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
          children: List.generate(foods.length, (i) {
            var food = foods[i];
            return NewTasteWidget(
              image: "assets/img/venture_1.jpg",
              title: food['name'],
              // time: '',
              rating: food['rate'],
              distance: food['distance'],
              restaurant: food['restaurant'], isAvailabe: food['isAvailable'],
            );
          }),
        ),
      ],
    );
  }
}
