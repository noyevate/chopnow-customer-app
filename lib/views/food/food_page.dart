import 'package:chopnow_new_customer_app/views/common/color_extension.dart';
import 'package:chopnow_new_customer_app/views/common/size.dart';
import 'package:flutter/material.dart';

class FoodPage extends StatefulWidget {
  const FoodPage({super.key});

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: const NeverScrollableScrollPhysics(),
        // padding: const EdgeInsets.only(top: 10),

        children: [
          Container(
            width: width,
            height: height,
            color: Tcolor.PRIMARY_S4,
          )
        ],
      ),
    );
  }
}