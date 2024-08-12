part of com.wenia.test.features.home.presentation;

class HomeScreen extends ConsumerWidget {
  const HomeScreen({
    super.key,
    required this.navigationShell,
  });

  static const String route = 'home';

  final StatefulNavigationShell navigationShell;

  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          t.home.title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        actions: <Widget>[
          InkWell(
            onTap: () => context.pushNamed(ProfileScreen.route),
            child: Container(
              padding: AppPaddings.small,
              margin: AppPaddings.xSmall,
              height: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSpacing.medium),
                color: Theme.of(context).primaryColor,
              ),
              child: Center(
                child: Text(
                  // ref.read(autheticationViewModelProvider) ??
                  'fdshj@yopmail.com'.firstPartEmail,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: _goBranch,
        destinations: <NavigationDestination>[
          NavigationDestination(
              icon: const Icon(Icons.list), label: t.home.list),
          NavigationDestination(
              icon: const Icon(Icons.star), label: t.home.favorites),
          NavigationDestination(
              icon: const Icon(Icons.compare), label: t.home.comparison),
        ],
      ),
    );
  }
}
