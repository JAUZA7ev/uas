import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProfileController extends GetxController {
  var orderHistory = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    fetchOrderHistory();
    super.onInit();
  }

  Future<void> fetchOrderHistory() async {
    final response = await http.get(
      Uri.parse('https://669b4a87276e45187d350953.mockapi.io/nusantara_delight/transaksi'),
    );

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      orderHistory.value = data.cast<Map<String, dynamic>>();
    } else {
      throw Exception('Failed to load order history');
    }
  }

  Future<http.Response> deleteTransaction(String id, String url) {
    return http.delete(Uri.parse(url));
  }
}
