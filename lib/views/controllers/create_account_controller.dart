import 'package:get/get.dart';
import 'package:flutter/material.dart';

class CreateAccountController extends GetxController {
  // Text Controllers
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  // Observables
  var isFormFilled = false.obs;

  // Dispose controllers
  @override
  void onClose() {
    firstNameController.dispose();
    lastNameController.dispose();
    phoneNumberController.dispose();
    emailController.dispose();
    super.onClose();
  }

  // Validate form
  void validateForm() {
    if (firstNameController.text.isNotEmpty &&
        lastNameController.text.isNotEmpty &&
        phoneNumberController.text.isNotEmpty &&
        emailController.text.isNotEmpty) {
      isFormFilled.value = true;
    } else {
      isFormFilled.value = false;
    }
  }


}
