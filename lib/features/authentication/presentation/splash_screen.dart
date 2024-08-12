part of com.wenia.test.features.authentication.presentation;

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  static const String route = '/';

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () {
        if (ref
            .read(autheticationViewModelProvider.notifier)
            .isAuthenticated()) {
          context.go('/${ListScreen.route}');
        } else {
          context.pushReplacementNamed(SignInScreen.route);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              AppImages.logo,
              width: MediaQuery.sizeOf(context).width * 0.5,
            ),
            const CircularProgressIndicator(),
            const Gap(AppSpacing.large),
            Text(t.loading),
          ],
        ),
      ),
    );
  }
}
