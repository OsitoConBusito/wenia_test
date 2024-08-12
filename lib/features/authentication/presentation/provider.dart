part of com.wenia.test.features.authentication.presentation;

final StateNotifierProvider<AuthenticationViewModel, String>
    autheticationViewModelProvider =
    StateNotifierProvider<AuthenticationViewModel, String>(
        (StateNotifierProviderRef<AuthenticationViewModel, String> ref) {
  return AuthenticationViewModel();
});
