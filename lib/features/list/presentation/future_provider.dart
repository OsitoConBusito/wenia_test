part of com.wenia.test.features.list.presentation;

final AutoDisposeFutureProviderFamily<List<CoinModel>, CryptoRequestDto>
    getCoinsFutureProvider = FutureProvider.family
        .autoDispose<List<CoinModel>, CryptoRequestDto>(
            (AutoDisposeFutureProviderRef<List<CoinModel>> ref,
                CryptoRequestDto dto) async {
  final ICryptoRepository repository = ref.watch(cryptoRepositoryProvider);

  final GetCryptosUseCase getCryptosUseCase = GetCryptosUseCase(repository);
  return getCryptosUseCase.execute(dto);
});
