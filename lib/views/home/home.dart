import 'package:chopnow_new_customer_app/enty_point.dart';
import 'package:chopnow_new_customer_app/views/common/color_extension.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Tcolor.White,
      body: Center(
        child: Text('Home Screen Content', selectionColor: Tcolor.Background_Dark,), // Replace with your actual content
      ),
      bottomNavigationBar: CustomBottomBar(),
    );
  }
}
