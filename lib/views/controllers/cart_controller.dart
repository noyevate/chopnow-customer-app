import 'package:chopnow_new_customer_app/views/common/color_extension.dart';
import 'package:chopnow_new_customer_app/views/common/size.dart';
import 'package:chopnow_new_customer_app/views/models/api_error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:heroicons_flutter/heroicons_flutter.dart';
import 'package:http/http.dart' as http;

class CartController extends GetxController {
  final box = GetStorage();
  RxBool _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  set setLoading(bool value) {
    _isLoading.value = value;
  }

  void addToCart(String cart) async {
    setLoading = true;

    String accessToken = box.read("token");
    var url = Uri.parse("$appBaseUrl/api/cart");

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken'
    };

    try {
      var response = await http.post(url, headers: headers, body: cart);

      if (response.statusCode == 201) {
        setLoading = false;

        Get.snackbar('Food Added to cart', 'Enjoy the awesome Experience.',
            snackPosition: SnackPosition.TOP,
            backgroundColor: Tcolor.BACKGROUND_Regaular,
            duration: const Duration(seconds: 5),
            colorText: Tcolor.TEXT_Body,
            icon: Icon(
              HeroiconsOutline.shoppingCart,
              size: 32.sp,
              color: Tcolor.Primary_New,
            ),
        );
      } else {
        var error = apiErrorFromJson(response.body);
        print(error.message);
        Get.snackbar('Error', error.message,
            snackPosition: SnackPosition.TOP,
            backgroundColor: Tcolor.ERROR_Light_1,
            duration: const Duration(seconds: 5),
            colorText: Tcolor.TEXT_Body,
            icon: Icon(
              HeroiconsOutline.shoppingCart,
              size: 32.sp,
              color: Tcolor.Primary_New,
            ),
        );
      }
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      setLoading = false;
    }
  }



  void removeFromCart(String productId) async {
    setLoading = true;

    String accessToken = box.read("token");
    var url = Uri.parse("$appBaseUrl/api/cart/$productId");

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken'
    };

    try {
      var response = await http.post(url, headers: headers);

      if (response.statusCode == 200) {
        setLoading = false;

        Get.snackbar('Food Removed from cart', 'Enjoy the awesome Experience.',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Tcolor.BACKGROUND_Regaular,
            colorText: Tcolor.TEXT_Body,
            icon: Icon(
              HeroiconsOutline.shoppingCart,
              size: 32.sp,
              color: Tcolor.Primary_New,
            ),
        );
      } else {
        var error = apiErrorFromJson(response.body);
        Get.snackbar('Error', error.message,
            snackPosition: SnackPosition.TOP,
            backgroundColor: Tcolor.ERROR_Light_1,
            colorText: Tcolor.TEXT_Body,
            icon: Icon(
              HeroiconsOutline.shoppingCart,
              size: 32.sp,
              color: Tcolor.Primary_New,
            ),
        );
      }
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      setLoading = false;
    }
  }
}
