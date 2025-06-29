// This class models the data structure of the JSON response from the API.
class XrpPrice {
  final double price; // We'll store the 'last_trade' value here.

  const XrpPrice({required this.price});

  // A factory constructor for creating a new XrpPrice instance from a map.
  // This is used to parse the JSON data.
  factory XrpPrice.fromJson(Map<String, dynamic> json) {
    // The API returns the price as a string, so we need to parse it to a double.
    // We are using the 'last_trade' field as the live value.
    final lastTrade = json['last_trade'];
    if (lastTrade == null) {
      throw FormatException("Missing 'last_trade' field in JSON response");
    }

    return XrpPrice(
      price: double.parse(lastTrade),
    );
  }
}