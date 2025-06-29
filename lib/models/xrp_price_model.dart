class XrpPrice {
  final double price;

  // ADD 'const' TO THE CONSTRUCTOR HERE
  const XrpPrice({required this.price});

  factory XrpPrice.fromJson(Map<String, dynamic> json) {
    final lastTrade = json['last_trade'];
    if (lastTrade == null) {
      throw FormatException("Missing 'last_trade' field in JSON response");
    }

    return XrpPrice(
      price: double.parse(lastTrade),
    );
  }
}