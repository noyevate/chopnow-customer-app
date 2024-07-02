import 'package:chopnow_new_customer_app/views/models/restaurant_model.dart';
import 'package:flutter/material.dart';

class FetchRestaurant {
  final RestaurantModel? data;
  final bool isLoading; // to determin wether our data is loading
  final Exception? error;
  final VoidCallback? refetch;

  FetchRestaurant({
    required this.data,
    required this.isLoading,
    required this.error,
    required this.refetch,
  });
}