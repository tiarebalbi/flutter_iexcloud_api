/// Price for a specified cryptocurrency.
class CryptoPrice {
  /// The price of the cryptocurrency
  final String price;

  /// The symbol of the cryptocurrency
  final String symbol;

  /// Default Constructor
  CryptoPrice({
    required this.price,
    required this.symbol,
  });

  /// Convert JSON to CryptoPrice
  static CryptoPrice? parse(Map<String, dynamic>? data) {
    if (data == null) return null;

    return CryptoPrice(
      price: data['price'],
      symbol: data['symbol'],
    );
  }
}
