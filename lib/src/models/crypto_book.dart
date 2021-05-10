class CryptoBook {
  final List<Price> bids;
  final List<Price> asks;

  CryptoBook(this.bids, this.asks);

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
  final num price;
  final num size;
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
