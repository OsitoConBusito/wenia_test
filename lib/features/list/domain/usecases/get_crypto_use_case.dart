part of com.wenia.test.features.list.domain.usecases;

class GetCryptosUseCase {
  GetCryptosUseCase(this.cryptoRepository);

  final ICryptoRepository cryptoRepository;

  Future<List<CoinModel>> execute(CryptoRequestDto dto) async =>
      cryptoRepository.getCoins(dto);
}
