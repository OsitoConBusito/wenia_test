part of com.wenia.test.features.list.data.repository;

final Provider<ICryptoRepository> cryptoRepositoryProvider =
    Provider<ICryptoRepository>((ProviderRef<ICryptoRepository> ref) {
  final http.Client client = http.Client();
  final CryptoRemoteDataSource remoteDataSource =
      CryptoRemoteDataSource(client);
  return CryptoRepositoryImpl(remoteDataSource);
});
