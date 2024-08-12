part of com.wenia.test.features.list.data.datasources;

class CryptoRequestDto {
  CryptoRequestDto({
    this.order = Order.market_cap_asc,
    this.id,
  });

  Order order;
  String? id;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'order': order.name,
        'ids': id,
        'vs_currency': 'usd',
      }.removeNullValues;

  copyWith({Order? order, String? id}) => CryptoRequestDto(
        order: order ?? this.order,
      );
}
