import 'package:chopnow_new_customer_app/views/common/color_extension.dart';
import 'package:chopnow_new_customer_app/views/common/reusable_text_widget.dart';
import 'package:chopnow_new_customer_app/views/common/size.dart';
import 'package:chopnow_new_customer_app/views/common/uidata.dart';
import 'package:chopnow_new_customer_app/views/hooks/fetch_user_order.dart';
import 'package:chopnow_new_customer_app/views/models/order_new_model.dart';
import 'package:chopnow_new_customer_app/views/order/widget/track_order.dart';
import 'package:chopnow_new_customer_app/views/shimmer/category_shimmer.dart';
import 'package:chopnow_new_customer_app/views/shimmer/food_tile_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class TrackingProcessingOrder extends HookWidget {
  const TrackingProcessingOrder({super.key});

  
  @override
  Widget build(BuildContext context) {

    String paymentStatus = "Completed";
  String orderStatus = "Placed";

    final hookResult = useFetchOrder(paymentStatus, orderStatus);
    final List<OrderModel>? orderList = hookResult.data ;
    final bool isLoading = hookResult.isLoading;
    final Exception? error = hookResult.error;

    return Container(
      color: Tcolor.White,
      
      child: 
        SizedBox(
          height: height,
          // padding: EdgeInsets.only(left: 12.w, top: 10.h),
          child:  isLoading ? ShimmerFoodTile() : orderList == null || orderList.isEmpty
                ? Center(child: Text('No categories available')):
               ListView(
            scrollDirection: Axis.horizontal,
            children: orderList.isNotEmpty ? [
              ProcessingOrder(order: orderList.last)
            ] : []
            ),
          ),
        );
      
    
  }
}
