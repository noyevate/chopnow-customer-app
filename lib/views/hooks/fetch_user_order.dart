// ignore_for_file: avoid_print

import 'package:chopnow_new_customer_app/views/common/size.dart';
import 'package:chopnow_new_customer_app/views/models/api_error.dart';
import 'package:chopnow_new_customer_app/views/models/hooks_model/hook_result.dart';
import 'package:chopnow_new_customer_app/views/models/order_new_model.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

FetchHook useFetchOrder(String paymentStatus, orderStatus) {
  final box = GetStorage();
  final order = useState<List<OrderModel>?>(null);
  final isLoading = useState<bool>(false);
  final error = useState<Exception?>(null);
  final apiError = useState<ApiError?>(null);

  Future<void> fetchData() async {
    String accessToken = box.read("token");


    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken'
    };
    isLoading.value = true;

    try {
      final url = Uri.parse("$appBaseUrl/api/order/status-and-payment?paymentStatus=$paymentStatus&orderStatus=$orderStatus");
      print(url.toString());
      final response = await http.get(url, headers: headers);
      print(" useFetchorder: ${response.statusCode}");
      
      if (response.statusCode == 200) {
        order.value = orderModelFromJson(response.body);
      } else {
        apiError.value = apiErrorFromJson(response.body);
      }
    } catch (e) {
      error.value = e as Exception;
    } finally {
      isLoading.value = false;
    }
  }

  useEffect(() {
    fetchData();
    return null;
  }, []);

  void refetch() {
    isLoading.value = true;
    fetchData();
  }

  return FetchHook(
    data: order.value,
    isLoading: isLoading.value,
    error: error.value,
    refetch: refetch,
  );
}
