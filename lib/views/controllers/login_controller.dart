import 'package:chopnow_new_customer_app/views/home/home.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class LoginController extends GetxController {
  // Text Controllers
  
  final TextEditingController phoneNumberController = TextEditingController();
  

  // Observables
  var isFormFilled = false.obs;

  // Dispose controllers
  @override
  void onClose() {
    
    phoneNumberController.dispose();
    
    super.onClose();
  }

  // Validate form
  void validateForm() {
    if (
        phoneNumberController.text.isNotEmpty
        ) {
      isFormFilled.value = true;
    } else {
      isFormFilled.value = false;
    }
  }

  var pin = ''.obs;

  void handleKeyPress(String value) {
    if (pin.value.length < 4) {
      pin.value += value;
      if (pin.value.length == 4) {
        submitPin(); // Automatically submit when 4 digits are entered
      }
    }
  }

  void clearPin() {
    pin.value = '';
  }

  void submitPin() {
    if (pin.value.length == 4) {
      // PIN is complete, handle the submission
      print("Submitted PIN: ${pin.value}");
            Get.offAll(() => const HomeScreen(), transition: Transition.fadeIn, duration: const Duration(milliseconds: 700));

      // Perform your submission logic here, e.g., API call or navigation
    } else {
      // PIN is not complete, show an error or warning
      print("PIN must be 4 digits");
    }
  }


}
