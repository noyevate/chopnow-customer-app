import 'package:chopnow_new_customer_app/views/models/single_restaurant_model.dart';
import 'package:flutter/material.dart';

class FetchSingleRestaurant {
  final SingleRestaurantModel? data;
  final bool isLoading; // to determin wether our data is loading
  final Exception? error;
  final VoidCallback? refetch;

  FetchSingleRestaurant({
    required this.data,
    required this.isLoading,
    required this.error,
    required this.refetch,
  });
}