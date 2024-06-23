import 'package:chopnow_new_customer_app/views/auth/create_account/widget/location.dart';
import 'package:get/get.dart';

class PinLoginController extends GetxController {
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
            Get.offAll(() => const Location(), transition: Transition.fadeIn, duration: const Duration(milliseconds: 700));

      // Perform your submission logic here, e.g., API call or navigation
    } else {
      // PIN is not complete, show an error or warning
      print("PIN must be 4 digits");
    }
  }
}
