import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/xrp_price_model.dart';

// This function handles the logic of fetching and parsing the data.
Future<XrpPrice> fetchXrpPrice() async {
  final uri = Uri.parse('https://api.mypapit.net/crypto/XRPMYR.json');
  
  try {
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON.
      // The jsonDecode function converts the JSON string into a Dart Map.
      // Then, our XrpPrice.fromJson factory constructor creates an object from that map.
      return XrpPrice.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response, throw an exception.
      throw Exception('Failed to load XRP price (Status code: ${response.statusCode})');
    }
  } catch (e) {
    // Catch any other errors, like network issues.
    throw Exception('Failed to fetch data: $e');
  }
}