part of com.wenia.test.features.list.data.datasources;

abstract class ICryptoRemoteDataSource {
  Future<List<CoinModel>> getCoins(CryptoRequestDto dto);
}

class CryptoRemoteDataSource implements ICryptoRemoteDataSource {
  CryptoRemoteDataSource(this.client);

  final http.Client client;

  @override
  Future<List<CoinModel>> getCoins(CryptoRequestDto dto) async {
    final http.Response response = await client.get(
      Uri.parse(
          '${Api.baseUrl}${Api.getCoinsUrl}?${dto.toJson().toQueryParams}'),
      headers: <String, String>{
        Api.apiKeyHeader: Api.criptoApiToken,
      },
    );

    if (response.statusCode == 200) {
      List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((dynamic json) => CoinModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load cryptos');
    }
  }
}
