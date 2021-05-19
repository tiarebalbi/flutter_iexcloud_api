class CryptoQuote {
  /// The symbol of the cryptocurrency
  final String symbol;

  /// This will always return cryptocurrency
  final String sector;

  /// This will always return realtime
  final String calculationPrice;

  /// The high of the cryptocurrency within the last 24 hours
  final String high;

  /// The low of the cryptocurrency within the last 24 hours
  final String low;

  /// The latest price for this cryptocurrency
  final String latestPrice;

  /// This will always be Real time price - this is a colloquial representation of calculationPrice
  final String latestSource;

  /// Epoch timestamp of when the price was last updated
  final DateTime latestUpdate;

  /// 24 hour trailing volume
  final String latestVolume;

  /// The price of the cryptocurrency 24 hours ago
  final String previousClose;

  /// The current bid price
  final String bidPrice;

  /// The current size of the bid
  final String bidSize;

  /// The current ask price
  final String askPrice;

  /// The current size of the ask
  final String askSize;

  /// Default Constructor
  CryptoQuote(
    this.symbol,
    this.sector,
    this.calculationPrice,
    this.high,
    this.low,
    this.latestPrice,
    this.latestSource,
    this.latestUpdate,
    this.latestVolume,
    this.previousClose,
    this.bidPrice,
    this.bidSize,
    this.askPrice,
    this.askSize,
  );

  /// Convert JSON to CryptoQuote
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
      data['latestVolume'],
      data['previousClose'],
      data['bidPrice'],
      data['bidSize'],
      data['askPrice'],
      data['askSize'],
    );
  }
}
