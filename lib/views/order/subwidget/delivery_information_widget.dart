import 'package:chopnow_new_customer_app/views/common/color_extension.dart';
import 'package:chopnow_new_customer_app/views/common/reusable_text_widget.dart';
import 'package:chopnow_new_customer_app/views/order/subwidget/icon_name_icon.dart';
import 'package:chopnow_new_customer_app/views/order/subwidget/tezt_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:heroicons_flutter/heroicons_flutter.dart';

class DeliveryInformationWidget extends StatelessWidget {
  const DeliveryInformationWidget({
    super.key,
    required this.firstName,
    required this.lastName,
    required this.phone,
  });

  final String firstName;
  final String lastName;
  final String phone;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ReuseableText(
            title: "Delivery information",
            style: TextStyle(
              fontSize: 28.sp,
              fontWeight: FontWeight.w500,
              color: Tcolor.Text,
            ),
          ),
          SizedBox(height: 50.h),
          IconNameIcon(
              name: "$firstName $lastName", icon: HeroiconsOutline.userCircle, icon2: HeroiconsOutline.pencil,),
          TeztWidget(text: phone),
    
          SizedBox(height: 30.h),
    
           const IconNameIcon(
              name: "23, Fate Rd", icon: HeroiconsOutline.userCircle, icon2: HeroiconsOutline.pencil,),
              const TeztWidget(text: "No 10 20033, Fate Road Ilorin, Kwara State"),
        ],
      ),
    );
  }
}
