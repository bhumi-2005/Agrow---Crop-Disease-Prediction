class MarketPrice {
  final String state;
  final String district;
  final String market;
  final String commodity;
  final String variety;
  final String arrivalDate;
  final double minPrice;
  final double maxPrice;
  final double modalPrice;
  final String lastUpdated;

  MarketPrice({
    required this.state,
    required this.district,
    required this.market,
    required this.commodity,
    required this.variety,
    required this.arrivalDate,
    required this.minPrice,
    required this.maxPrice,
    required this.modalPrice,
    required this.lastUpdated,
  });

  factory MarketPrice.fromJson(Map<String, dynamic> json) {
    return MarketPrice(
      state: json['state'] ?? '',
      district: json['district'] ?? '',
      market: json['market'] ?? '',
      commodity: json['commodity'] ?? '',
      variety: json['variety'] ?? 'Standard',
      arrivalDate: json['arrival_date'] ?? '',
      minPrice: _parsePrice(json['min_price']),
      maxPrice: _parsePrice(json['max_price']),
      modalPrice: _parsePrice(json['modal_price']),
      lastUpdated: json['timestamp'] ?? 'Unknown',
    );
  }

  static double _parsePrice(dynamic price) {
    if (price == null) return 0.0;
    if (price is int) return price.toDouble();
    if (price is double) return price;
    if (price is String) {
      try {
        return double.parse(price);
      } catch (e) {
        return 0.0;
      }
    }
    return 0.0;
  }

  // Helper for getting price change (could be calculated from historical data in a real app)
  double getPriceChange() {
    // This would normally be calculated from historical data
    // For now, return a random value between -5 and +5
    return 0.0; // In a real app, you'd have historical data to calculate this
  }
}
