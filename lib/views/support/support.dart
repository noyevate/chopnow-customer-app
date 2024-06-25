import 'package:chopnow_new_customer_app/views/common/color_extension.dart';
import 'package:chopnow_new_customer_app/views/common/custom_appbar.dart';
import 'package:chopnow_new_customer_app/views/common/reusable_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SupportPage extends StatelessWidget {
  const SupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(200.h), child: const CustomAppBar()),
      body: Center(
        child: ReuseableText(title: "Support Page", style: TextStyle(fontSize: 30.sp, color: Tcolor.BACKGROUND_Dark,fontWeight: FontWeight.bold)),
      ),
    );
  }
}