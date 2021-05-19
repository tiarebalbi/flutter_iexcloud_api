class CryptoBook {
  /// List of recent Bid
  final List<Price> bids;

  /// List of recent Ask
  final List<Price> asks;

  /// Default Constructor
  CryptoBook(this.bids, this.asks);

  /// Convert JSON to Object
  static CryptoBook? parse(Map<String, dynamic>? data) {
    if (data == null) {
      return null;
    }

    return CryptoBook(
      Price.parse(data['bids']),
      Price.parse(data['asks']),
    );
  }
}

class Price {
  /// The price of the bid or ask
  final num price;

  /// The total quantity remaining at the price
  final num size;

  /// Epoch timestamp of when the price level was last updated
  final DateTime timestamp;

  Price(this.price, this.size, this.timestamp);

  static List<Price> parse(List<Map<String, dynamic>>? data) {
    if (data == null) {
      return [];
    }

    return data
        .map(
          (e) => Price(
            e['price'],
            e['size'],
            DateTime.fromMillisecondsSinceEpoch(e['timestamp']),
          ),
        )
        .toList();
  }
}
