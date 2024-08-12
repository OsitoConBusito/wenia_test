import 'package:wenia_test/features/list/data/datasources/datasources.dart';
import 'package:wenia_test/features/list/data/model/model.dart';

abstract class ICryptoRepository {
  Future<List<CoinModel>> getCoins(CryptoRequestDto dto);
}
