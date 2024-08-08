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

import '../order_tracking_widgets/subwidget/note_to_vendors.dart';
import '../order_tracking_widgets/subwidget/order_id_and_time.dart';
import '../order_tracking_widgets/subwidget/textn_price_widget.dart';

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

class ProcessingOrder extends HookWidget {
  const ProcessingOrder({super.key, required this.order});

  final OrderModel order;

  @override
  Widget build(BuildContext context) {
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
                  RestaurantLogoCall(
                    order: order,
                    onRestaurantFetched: (fetchedRestaurant) {
                      WidgetsBinding.instance.addPostFrameCallback((__) {
                        restaurant.value = fetchedRestaurant;
                      });
                    },
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
              child: NoteToVendors(
                title1: order.orderItems[0].instruction.isEmpty
                    ? "no note to Restaurant.."
                    : order.orderItems[0].instruction,
                title2:
                    order.notes.isEmpty ? "no note to Rider.." : order.notes,
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
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      OrderIdAndTime(
                        title1: "Order ID: ",
                        title2: order.id,
                      ),
                      OrderIdAndTime(
                        fontWeight: FontWeight.w400,
                          title1: "Order time: ",
                          title2: hourTime(order.createdAt.toString()))
                    ],
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  ReuseableText(
                    title: "ORDER DETAILS",
                    style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w700,
                        color: Tcolor.Text),
                  ),
                  for (int i = 0; i < order.orderItems[0].additives.length; i++)
                    Container(
                      key: ValueKey(i),
                      // padding: EdgeInsets.symmetric(horizontal: 30.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 40.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ReuseableText(
                                title: "Pack ${i + 1}",
                                style: TextStyle(
                                  fontSize: 28.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Tcolor.TEXT_Body,
                                ),
                              ),
                              ReuseableText(
                                title: order.orderTotal.toString(),
                                style: TextStyle(
                                  fontSize: 28.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Tcolor.TEXT_Body,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.w,
                          ),
                          ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: order.orderItems.length,
                              itemBuilder: (context, index) {
                                final orderItem = order.orderItems[index];
                                return Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        ReuseableText(
                                          title: order.orderItems[0]
                                              .additives[0].foodTitle,
                                          style: TextStyle(
                                            fontSize: 28.sp,
                                            fontWeight: FontWeight.w400,
                                            color: Tcolor.TEXT_Body,
                                          ),
                                        ),
                                        ReuseableText(
                                          title:
                                              "x${order.orderItems[0].additives[0].foodCount}",
                                          style: TextStyle(
                                            fontSize: 28.sp,
                                            fontWeight: FontWeight.w400,
                                            color: Tcolor.TEXT_Body,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10.w,
                                    ),
                                    ListView.builder(
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemCount: orderItem.additives.length,
                                        itemBuilder: (context, additiveIndex) {
                                          final additive = orderItem
                                              .additives[additiveIndex];
                                          return Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 10.h),
                                            child: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    ReuseableText(
                                                      title: additive.name,
                                                      style: TextStyle(
                                                        fontSize: 28.sp,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: Tcolor.TEXT_Body,
                                                      ),
                                                    ),
                                                    ReuseableText(
                                                      title:
                                                          "x${additive.quantity}",
                                                      style: TextStyle(
                                                        fontSize: 28.sp,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: Tcolor.TEXT_Body,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          );
                                        }),
                                  ],
                                );
                              }),
                          Divider(
                            thickness: 2,
                            color: Tcolor.BACKGROUND_Regaular,
                          ),
                          // SizedBox(height: 20.h),
                        ],
                      ),
                    ),
                  TextnPriceWidget(
                    title: 'Subtotal',
                    title1: "${order.orderTotal}",
                  ),
                  SizedBox(height: 30.h),
                  TextnPriceWidget(
                    title: 'Service fee',
                    title1: "${((order.orderTotal) * 0.12).round()}",
                  ),
                  SizedBox(height: 30.h),
                  TextnPriceWidget(
                    title: 'Delivery Fee',
                    title1: "${order.deliveryFee}",
                  ),
                  SizedBox(height: 30.h),
                  TextnPriceWidget(
                    title: 'Total',
                    title1: "${order.grandTotal}",
                    fontWeight: FontWeight.w500,
                    fontWeight2: FontWeight.w500,
                    fontSize1: 32.sp,
                    fontSize: 32.sp,
                  ),
                  SizedBox(height: 30.h),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
