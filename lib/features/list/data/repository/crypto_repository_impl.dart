part of com.wenia.test.features.list.data.repository;

class CryptoRepositoryImpl implements ICryptoRepository {
  CryptoRepositoryImpl(this.remoteDataSource);

  final ICryptoRemoteDataSource remoteDataSource;

  @override
  Future<List<CoinModel>> getCoins(CryptoRequestDto dto) async {
    final List<CoinModel> cryptoModels = await remoteDataSource.getCoins(dto);
    return cryptoModels;
  }
}
