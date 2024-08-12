part of com.wenia.test.features.list.domain.entities;

class Coin {
  Coin({
    required this.id,
    required this.symbol,
    required this.name,
  });

  factory Coin.fromJson(Map<String, dynamic> json) => Coin(
        id: json['id'],
        symbol: json['symbol'],
        name: json['name'],
      );

  final String id;
  final String symbol;
  final String name;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'symbol': symbol,
        'name': name,
      };
}
