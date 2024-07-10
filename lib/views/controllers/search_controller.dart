// ignore_for_file: unused_local_variable

import 'package:chopnow_new_customer_app/views/models/food_model.dart';
import 'package:get/get.dart';
import 'package:chopnow_new_customer_app/views/common/size.dart';
import 'package:chopnow_new_customer_app/views/models/api_error.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class SearchRestaurantFoodController extends GetxController {
  RxBool _isLoading = false.obs;

  bool get isLoading => _isLoading.value;
  set setLoading(bool value) {
    _isLoading.value = value;
  }

  List<FoodModel>? foodSearch;

  void searchFood(
    String restaurantId,
    String? restaurantCategory,
    String? title,
  ) async {
    setLoading = true;

    try {
      // Build query parameters
      final queryParams = {
        'restaurant': restaurantId,
        // if (restaurantCategory != null)
        //   'restaurantCategory': restaurantCategory,
        if (title != null) 'title': title,
      };

      final uri = Uri.parse("$appBaseUrl/api/food/search-restaurant-food").replace(queryParameters: queryParams);
      final response = await http.get(uri);

      print("useFoodSearch: ${response.statusCode}");

      if (response.statusCode == 200) {
        foodSearch = foodModelFromJson(response.body);
        setLoading = false;
      } else {
        setLoading = false;
        final error = apiErrorFromJson(response.body);
      }
    } catch (e) {
      setLoading = false;
      debugPrint(e.toString());
    } finally {
      setLoading = false;
    }
  }
}
