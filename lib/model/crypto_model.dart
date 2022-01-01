import 'dart:convert';

Crypto cryptoFromJson(String str) => Crypto.fromJson(json.decode(str));

String cryptoToJson(Crypto data) => json.encode(data.toJson());

class Crypto {
  Crypto({
    required this.status,
    required this.data,
  });

  Status status;
  List<Datum> data;

  factory Crypto.fromJson(Map<String, dynamic> json) => Crypto(
    status: Status.fromJson(json["status"]),
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status.toJson(),
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    required this.name,
    required this.symbol,
    required this.metrics,
  });

  String name;
  String symbol;
  Metrics metrics;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    name: json["name"],
    symbol: json["symbol"],
    metrics: Metrics.fromJson(json["metrics"]),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "symbol": symbol,
    "metrics": metrics.toJson(),
  };
}

class Metrics {
  Metrics({
    required this.marketData,
  });

  MarketData marketData;

  factory Metrics.fromJson(Map<String, dynamic> json) => Metrics(
    marketData: MarketData.fromJson(json["market_data"]),
  );

  Map<String, dynamic> toJson() => {
    "market_data": marketData.toJson(),
  };
}

class MarketData {
  MarketData({
    required this.priceUsd,
  });

  double priceUsd;

  factory MarketData.fromJson(Map<String, dynamic> json) => MarketData(
    priceUsd: json["price_usd"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "price_usd": priceUsd,
  };
}

class Status {
  Status({
    required this.elapsed,
    required this.timestamp,
  });

  int elapsed;
  DateTime timestamp;

  factory Status.fromJson(Map<String, dynamic> json) => Status(
    elapsed: json["elapsed"],
    timestamp: DateTime.parse(json["timestamp"]),
  );

  Map<String, dynamic> toJson() => {
    "elapsed": elapsed,
    "timestamp": timestamp.toIso8601String(),
  };
}
