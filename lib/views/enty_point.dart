import 'package:chopnow_new_customer_app/views/cart/cart.dart';
import 'package:chopnow_new_customer_app/views/common/color_extension.dart';
import 'package:chopnow_new_customer_app/views/common/custom_bottom_bar.dart';
import 'package:chopnow_new_customer_app/views/home/home.dart';
import 'package:chopnow_new_customer_app/views/profile/profile.dart';
import 'package:chopnow_new_customer_app/views/search/search.dart';
import 'package:chopnow_new_customer_app/views/support/support.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> pageList = const [
    Hompage(),
    SearchPage(),
    CartPage(),
    SupportPage(),
    ProfilePage()
  ];

  void _onNavItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: pageList[_selectedIndex],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: CustomBottomNav(
              selectedIndex: _selectedIndex,
              onItemTapped: _onNavItemTapped,
            ),
          ),
          Positioned(
            bottom: 25.sp, // Adjust the bottom margin to align with your bottom nav
            left: 0,
            right: 0,
            child: Center(
              child: SizedBox(
                height: 80.h,
                width: 80.h,
                child: FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      _selectedIndex = 2; // Set index to CartPage
                    });
                  },
                  backgroundColor: Tcolor.Primary,
                  shape: const CircleBorder(),
                  child: Icon(
                    Icons.shopping_bag,
                    color: Tcolor.TEXT_Label,
                    size: 50.sp,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
