class CryptoQuote {
  final String symbol;
  final String sector;
  final String calculationPrice;
  final String high;
  final String low;
  final String latestPrice;
  final String latestSource;
  final DateTime latestUpdate;
  final String previousClose;
  final String bidPrice;
  final String bidSize;
  final String askPrice;
  final String askSize;

  CryptoQuote(
    this.symbol,
    this.sector,
    this.calculationPrice,
    this.high,
    this.low,
    this.latestPrice,
    this.latestSource,
    this.latestUpdate,
    this.previousClose,
    this.bidPrice,
    this.bidSize,
    this.askPrice,
    this.askSize,
  );

  static CryptoQuote? parse(Map<String, dynamic>? data) {
    if (data == null) {
      return null;
    }

    return CryptoQuote(
      data['symbol'],
      data['sector'],
      data['calculationPrice'],
      data['high'],
      data['low'],
      data['latestPrice'],
      data['latestSource'],
      DateTime.fromMillisecondsSinceEpoch(data['latestUpdate']),
      data['previousClose'],
      data['bidPrice'],
      data['bidSize'],
      data['askPrice'],
      data['askSize'],
    );
  }
}
