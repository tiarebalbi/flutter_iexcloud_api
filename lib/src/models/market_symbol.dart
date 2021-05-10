class MarketSymbol {
  final String symbol;
  final String exchange;
  final String name;
  final String date;
  final bool isEnabled;
  final String type;
  final String region;
  final String currency;
  final String iexId;
  final String figi;
  final String cik;

  MarketSymbol(
    this.symbol,
    this.exchange,
    this.name,
    this.date,
    this.isEnabled,
    this.type,
    this.region,
    this.currency,
    this.iexId,
    this.figi,
    this.cik,
  );

  static List<MarketSymbol> parse(List<Map<String, dynamic>>? data) {
    if (data == null) {
      return [];
    }

    return data
        .map(
          (e) => MarketSymbol(
            e['symbol'],
            e['exchange'],
            e['name'],
            e['date'],
            e['isEnabled'],
            e['type'],
            e['region'],
            e['currency'],
            e['iexId'],
            e['figi'],
            e['cik'],
          ),
        )
        .toList();
  }
}
