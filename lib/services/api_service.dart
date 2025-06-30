import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/xrp_price_model.dart';

Future<XrpPrice> fetchXrpPrice() async {
  final uri = Uri.parse('https://api.mypapit.net/crypto/XRPMYR.json');
  
  try {
    final response = await http.get(uri);

    if (response.statusCode == 200) {

      return XrpPrice.fromJson(jsonDecode(response.body));
    } else {

      throw Exception('Failed to load XRP price (Status code: ${response.statusCode})');
    }
  } catch (e) {

    throw Exception('Failed to fetch data: $e');
  }
}