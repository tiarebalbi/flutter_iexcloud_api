/// Price for a specified cryptocurrency.
class CryptoPrice {
  /// The price of the cryptocurrency
  final String price;

  /// The symbol of the cryptocurrency
  final String symbol;

  CryptoPrice({
    required this.price,
    required this.symbol,
  });

  static CryptoPrice? parse(Map<String, dynamic>? data) {
    if (data == null) return null;

    return CryptoPrice(
      price: data["price"],
      symbol: data["symbol"],
    );
  }
}
