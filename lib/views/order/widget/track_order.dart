import 'package:cached_network_image/cached_network_image.dart';
import 'package:chopnow_new_customer_app/views/common/color_extension.dart';
import 'package:chopnow_new_customer_app/views/common/reusable_text_widget.dart';
import 'package:chopnow_new_customer_app/views/common/size.dart';
import 'package:chopnow_new_customer_app/views/enty_point.dart';
import 'package:chopnow_new_customer_app/views/models/order_new_model.dart';
import 'package:chopnow_new_customer_app/views/models/single_restaurant_model.dart';
import 'package:chopnow_new_customer_app/views/order/order_tracking_widgets/subwidget/restaurant_logo_call.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:heroicons_flutter/heroicons_flutter.dart';
import 'package:intl/intl.dart';

String formatDate(String dateStr) {
  DateTime dateTime = DateTime.parse(dateStr).toLocal();
  DateFormat outputFormat = DateFormat('EEE, d MMM yyyy, h:mm a', 'en_US');
  return outputFormat.format(dateTime);
}

String hourTime(String dateStr) {
  DateTime dateTime = DateTime.parse(dateStr).toLocal();
  DateFormat outputFormat = DateFormat('h:mm a', 'en_US');
  return outputFormat.format(dateTime);
}

const String createdAt = "2024-08-03T21:13:49.506Z";

class ProcessingOrder extends HookWidget {
  const ProcessingOrder({super.key, required this.order});

  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    print(formatDate(createdAt));
     final restaurant = useState<SingleRestaurantModel?>(null);
    return Container(
      // padding: EdgeInsets.only(left: 30.w, right: 30.w),
      height: height,
      width: width,
      color: Tcolor.BACKGROUND_Regaular,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Tcolor.White,
              padding: EdgeInsets.only(left: 30.w, right: 30.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 50.h,
                  ),
                  Container(
                    height: 64.h,
                    width: 64.h,
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(32.h), // Updated radius
                        color: Tcolor.BACKGROUND_Regaular),
                    child: GestureDetector(
                      onTap: () {
                        Get.off(() => const MainScreen());
                      },
                      child: Icon(
                        HeroiconsOutline.arrowLeft,
                        color: Tcolor.Text,
                        size: 32.sp,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 60.h,
                  ),
                  ReuseableText(
                    title: "Processing order",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 48.sp,
                        color: Tcolor.Text),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  ReuseableText(
                    title: formatDate("${order.createdAt}"),
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 28.sp,
                        color: Tcolor.TEXT_Label),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 70.h,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(40.h), // Updated radius
                            color: Tcolor.Secondary_Base,
                          ),
                          child: Icon(
                            HeroiconsSolid.creditCard,
                            size: 35.sp,
                            color: Tcolor.TEXT_White,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          color: Tcolor.Secondary_Base,
                          height: 5.h,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 70.h,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(40.h), // Updated radius
                            color: Tcolor.BACKGROUND_Dark,
                          ),
                          child: Icon(
                            HeroiconsSolid.buildingStorefront,
                            size: 35.sp,
                            color: Tcolor.TEXT_Placeholder,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          color: Tcolor.BORDER_Light,
                          height: 5.h,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 70.h,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(40.h), // Updated radius
                            color: Tcolor.BACKGROUND_Dark,
                          ),
                          child: Icon(
                            Ionicons.hourglass_sharp,
                            size: 35.sp,
                            color: Tcolor.TEXT_Placeholder,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          color: Tcolor.BORDER_Light,
                          height: 5.h,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 70.h,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(40.h), // Updated radius
                            color: Tcolor.BACKGROUND_Dark,
                          ),
                          child: Icon(
                            HeroiconsSolid.computerDesktop,
                            size: 35.sp,
                            color: Tcolor.TEXT_Placeholder,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          color: Tcolor.BORDER_Light,
                          height: 5.h,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 70.h,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(40.h), // Updated radius
                            color: Tcolor.BACKGROUND_Dark,
                          ),
                          child: Icon(
                            HeroiconsSolid.home,
                            size: 35.sp,
                            color: Tcolor.TEXT_Placeholder,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Container(
              color: Tcolor.White,
              padding: EdgeInsets.only(left: 30.w, right: 30.w),
              child: Column(
                children: [
                  SizedBox(
                    height: 30.h,
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     Row(
                  //       children: [
                  //         Container(
                  //           height: 70.h,
                  //           width: 70.w,
                  //           color: Tcolor.White,
                  //           child: ClipRRect(
                  //               borderRadius: BorderRadius.all(
                  //                 Radius.circular(100.r),
                  //               ),
                  //               child: Image.asset("assets/img/res_logo_1.png")
                  //               // CachedNetworkImage(
                  //               //   imageUrl: restaurant.logoUrl,
                  //               //   fit: BoxFit.contain,
                  //               // ),
                  //               ),
                  //         ),
                  //         SizedBox(
                  //           width: 20.w,
                  //         ),
                  //         ReuseableText(
                  //           title: "Iya Kamo",
                  //           style: TextStyle(
                  //               fontSize: 32.sp,
                  //               fontWeight: FontWeight.w500,
                  //               color: Tcolor.Text),
                  //         )
                  //       ],
                  //     ),
                  //     Container(
                  //       height: 64.h,
                  //       width: 64.h,
                  //       decoration: BoxDecoration(
                  //           borderRadius: BorderRadius.circular(32.h),
                  //           border: Border.all(
                  //               color: Tcolor.BORDER_Light), // Updated radius
                  //           color: Tcolor.White),
                  //       child: GestureDetector(
                  //         onTap: () {},
                  //         child: Icon(
                  //           HeroiconsSolid.phone,
                  //           color: Tcolor.Text,
                  //           size: 32.sp,
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  RestaurantLogoCall(order: order,  onRestaurantFetched: (fetchedRestaurant) {
                        WidgetsBinding.instance.addPostFrameCallback((__) {
                          restaurant.value = fetchedRestaurant;
                        });
                      },),
                  SizedBox(
                    height: 20.h,
                  ),
                  Divider(
                    color: Tcolor.BORDER_Light,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                              height: 70.h,
                              width: 70.w,
                              decoration: BoxDecoration(
                                  gradient: Tcolor.SECONDARY_Button_gradient,
                                  borderRadius: BorderRadius.circular(100.r)),
                              child: Icon(
                                HeroiconsSolid.computerDesktop,
                                size: 32.sp,
                                color: Tcolor.White,
                              )),
                          SizedBox(
                            width: 20.w,
                          ),
                          Container(
                            color: Tcolor.BORDER_Light,
                            height: 5.h,
                            width: 30.w,
                          ),
                        ],
                      ),
                      Container(
                        height: 64.h,
                        width: 64.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(32.h),
                            border: Border.all(
                                color: Tcolor.BORDER_Light), // Updated radius
                            color: Tcolor.White),
                        child: Icon(
                          HeroiconsSolid.phone,
                          color: Tcolor.TEXT_Placeholder,
                          size: 32.sp,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Container(
              color: Tcolor.White,
              padding: EdgeInsets.only(left: 30.w, right: 30.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30.h,
                  ),
                  ReuseableText(
                    title: "Note to store",
                    style: TextStyle(
                        fontSize: 28.sp,
                        fontWeight: FontWeight.w400,
                        color: Tcolor.TEXT_Label),
                  ),
                  SizedBox(
                    height: 15.w,
                  ),
                  ReuseableText(
                    title: "Add more stew to the rice",
                    style: TextStyle(
                        fontSize: 32.sp,
                        fontWeight: FontWeight.w400,
                        color: Tcolor.TEXT_Body),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Divider(
                    color: Tcolor.BORDER_Light,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  ReuseableText(
                    title: "Note to rider",
                    style: TextStyle(
                        fontSize: 28.sp,
                        fontWeight: FontWeight.w400,
                        color: Tcolor.TEXT_Label),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  ReuseableText(
                    title: "Drop it by the door",
                    style: TextStyle(
                        fontSize: 32.sp,
                        fontWeight: FontWeight.w400,
                        color: Tcolor.TEXT_Body),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 20.h,
            ),

            // Container(
            //   color: Tcolor.White,
            //   padding: EdgeInsets.only(left: 30.w, right: 30.w),
            //   child: ,
            // )
          ],
        ),
      ),
    );
  }
}
