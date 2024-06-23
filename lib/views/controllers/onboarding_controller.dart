import 'package:chopnow_new_customer_app/views/common/color_extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  final PageController pageController = PageController();
  int currentPage = 0;
  void nextPage() {
    if (currentPage < 2) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      // If on the last page, you might want to navigate to another screen or handle it differently.
      // For example:
      // Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
  
    }
  }

  

  Color getButtonColor(int pageIndex) {
    switch (pageIndex) {
      case 0:
        return Tcolor.Primary;
      case 1:
        return Tcolor.SECONDARY_Button;
      case 2:
      default:
        return Tcolor.Primary;
    }
  }

  Color getButtonTextColor(int pageIndex) {
    switch (pageIndex) {
      case 0:
        return Tcolor.Text;
      case 1:
        return Tcolor.TEXT_White;
      case 2:
      default:
        return Tcolor.Text;
    }
  }
  Color getArrowColor(int pageIndex) {
    switch (pageIndex) {
      case 0:
        return Tcolor.Text;
      case 1:
        return Tcolor.TEXT_White;
      case 2:
      default:
        return Tcolor.Text;
    }
  }
}