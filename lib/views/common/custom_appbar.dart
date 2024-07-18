// ignore_for_file: unused_import

import 'package:chopnow_new_customer_app/views/common/color_extension.dart';
import 'package:chopnow_new_customer_app/views/common/reusable_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
      width: double.infinity,
      height: 210.h,
      padding: EdgeInsets.fromLTRB(24.w, 70.h, 24.w, 0),
      color: Tcolor.White,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50.r,
                // backgroundColor: Tcolor.placeHolder,
                // Uncomment the line below if you have a valid image URL

                child: Image.asset("assets/img/bottombar_profile.png", height: 100.h, width: 100.w,),
              ),
              SizedBox(width: 10.w),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                  ReuseableText(
                    title: "${getTimeOfDay()}, Nathaniel",
                    style: TextStyle(
                      color: Tcolor.Text,
                      fontSize: 32.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5.h,),
                  Row(
                    children: [
                      Icon(Icons.location_pin, size: 30.sp, color: Tcolor.Primary,),
                      SizedBox(width: 7.w,),
                      SizedBox(
                        width: 300.w,
                        child: ReuseableText(
                          title: "No 10, Tanke, Oke Odo Ilo, Kw.St",
                          style: TextStyle(
                            color: Tcolor.TEXT_Label,
                            fontSize: 24.sp,
                            fontWeight: FontWeight.normal,
                            overflow: TextOverflow.ellipsis
                          ),
                        ),
                      ),
                      Icon(Icons.arrow_drop_down, size: 40.sp, color: Tcolor.TEXT_Placeholder,),

                    ],
                  ),
                ],
              ),
            ],
          ),
          // Text(
          //   getTimeOfDay(),
          //   style: const TextStyle(fontSize: 35),
          // )
        ],
      ),
    );
  }

  String getTimeOfDay() {
    final now = DateTime.now();
    final hour = now.hour;

    if (hour >= 7 && hour < 12) {
      return 'Good morning'; // Between 7am and 4pm
    } else if (hour >= 12 && hour < 16) {
      return "Good afternoon"; // Between 4pm and 7pm
    } else if (hour >= 16 && hour < 20) {
      return 'Good evening'; // Between 7pm and 7am
    } else if (hour >= 20 && hour < 5) {
      return "Enjoy you night";
    } else{
      return "Hello";
    }
  }

//   Future<Position> _determinePosition() async {
//   bool serviceEnabled;
//   LocationPermission permission;

//   // Test if location services are enabled.
//   serviceEnabled = await Geolocator.isLocationServiceEnabled();
//   if (!serviceEnabled) {
//     // Location services are not enabled don't continue
//     // accessing the position and request users of the 
//     // App to enable the location services.
//     return Future.error('Location services are disabled.');
//   }

//   permission = await Geolocator.checkPermission();
//   if (permission == LocationPermission.denied) {
//     permission = await Geolocator.requestPermission();
//     if (permission == LocationPermission.denied) {
//       // Permissions are denied, next time you could try
//       // requesting permissions again (this is also where
//       // Android's shouldShowRequestPermissionRationale 
//       // returned true. According to Android guidelines
//       // your App should show an explanatory UI now.
//       return Future.error('Location permissions are denied');
//     }
//   }
  
//   if (permission == LocationPermission.deniedForever) {
//     // Permissions are denied forever, handle appropriately. 
//     return Future.error(
//       'Location permissions are permanently denied, we cannot request permissions.');
//   } 

//   // When we reach here, permissions are granted and we can
//   // continue accessing the position of the device.
//   return await Geolocator.getCurrentPosition();
// }
}
