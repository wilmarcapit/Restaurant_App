import 'dart:convert';
import 'dart:math';

import 'package:restaurant_app/App/Models/Order_data_model.dart';
import 'package:http/http.dart' as http;

class OrderRepo {
  static Future<List<OrderModel>> fetchOrder() async {
    var client = http.Client();
    List<OrderModel> posts = [];
    try {
      var response = await client.get(
        Uri.parse('http://api.portal.ramcapcloud.com/api/kitchen/getorder/5'),
      );

      List result = jsonDecode(response.body);
      for (int i = 0; i < result.length; i++) {
        OrderModel post =
            OrderModel.fromJson(result[i] as Map<String, dynamic>);
        posts.add(post);
      }
      return posts;
    } catch (e) {
      print(e.toString()); // Log the exception as a string
      return [];
    }
  }
}
