part of com.wenia.test.features.list.presentation;

class ListScreen extends ConsumerStatefulWidget {
  const ListScreen({super.key});

  static const String route = 'list';

  @override
  ConsumerState<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends ConsumerState<ListScreen> {
  late CryptoRequestDto dto = CryptoRequestDto();

  @override
  Widget build(BuildContext context) {
    final AsyncValue<List<CoinModel>> asyncValue =
        ref.watch(getCoinsFutureProvider(dto));
    return Scaffold(
      body: Padding(
        padding: AppPaddings.medium,
        child: asyncValue.when(
          data: (List<CoinModel> data) => ListView.builder(
            itemCount: data.length,
            itemBuilder: (BuildContext context, int index) {
              final CoinModel item = data[index];
              return Padding(
                padding: AppPaddings.verticalSmall,
                child: ListTile(
                  title: Text(item.name),
                  subtitle: Text(item.id),
                  leading: Text(
                    item.symbol,
                  ),
                  trailing: Text('${item.currentPrice?.toString() ?? ''} USD'),
                  tileColor: Theme.of(context).colorScheme.onPrimary,
                ),
              );
            },
          ),
          error: (Object error, StackTrace stackTrace) => const Center(
            child: Text('Error'),
          ),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          dto = dto.copyWith(
            order: dto.order == Order.market_cap_asc
                ? Order.market_cap_desc
                : Order.market_cap_asc,
          );
          setState(() {});
        },
        child: Icon(
          dto.order == Order.market_cap_asc
              ? Icons.arrow_upward
              : Icons.arrow_downward,
        ),
      ),
    );
  }
}
