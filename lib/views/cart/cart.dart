import 'package:chopnow_new_customer_app/views/common/color_extension.dart';
import 'package:chopnow_new_customer_app/views/common/reusable_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ReuseableText(title: "Cart Page", style: TextStyle(fontSize: 30.sp, color: Tcolor.BACKGROUND_Dark,fontWeight: FontWeight.bold)),
      ),
    );
  }
}