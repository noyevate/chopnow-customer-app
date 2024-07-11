// ignore_for_file: unused_local_variable, prefer_final_fields

import 'dart:convert';

import 'package:chopnow_new_customer_app/views/models/food_model.dart';
import 'package:chopnow_new_customer_app/views/models/restaurant_model.dart';
import 'package:chopnow_new_customer_app/views/models/search_response_model.dart';
import 'package:get/get.dart';
import 'package:chopnow_new_customer_app/views/common/size.dart';
import 'package:chopnow_new_customer_app/views/models/api_error.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class SearchFoodRestaurantController extends GetxController {

  
  RxBool _isLoading = false.obs;

  bool get isLoading => _isLoading.value;
  set setLoading(bool value) {
    _isLoading.value = value;
  }

  List<FoodModel>? foodSearch;
  List<RestaurantModel>? restaurantSearch;

  void searchFod(String key) async {
    setLoading = true;

    Uri url = Uri.parse("$appBaseUrl/food/search/$key");

    try {
      var response = await http.get(url);
      print("searched Foods or restaurating: $response");
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        var searchResponse = SearchResponse.fromJson(jsonResponse);
        foodSearch = searchResponse.foods;
        restaurantSearch = searchResponse.restaurants;
        setLoading = false;
        
      } else {
        setLoading = false;
        var error = apiErrorFromJson(response.body);
      }
    } catch (e) {
      setLoading = false;
      debugPrint(e.toString());
    }
  }
  


}
