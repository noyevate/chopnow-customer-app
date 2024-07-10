import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TestRestaurant extends StatelessWidget {
  const TestRestaurant({super.key, this.background});

  final Widget? background;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers:  [
          SliverAppBar(
            automaticallyImplyLeading: false,
            expandedHeight: 300.h,
            flexibleSpace: FlexibleSpaceBar(
              background:  background,
              
            ),
          ),
          
          
        ],
      ),
    );
  }
}