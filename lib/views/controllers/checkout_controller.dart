import 'package:flutter/material.dart';
import 'package:get/get.dart';
// Make sure to import the SelectedItem class

class CheckoutController extends GetxController {
  
    final TextEditingController noToRestaurant = TextEditingController();
  final TextEditingController noteToRider = TextEditingController();


  @override
  void onClose() {
    noToRestaurant.dispose();
    noteToRider.dispose();
    super.onClose();
  }
}
