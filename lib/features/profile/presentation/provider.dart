part of com.wenia.test.features.profile.presentation;

final AutoDisposeStateNotifierProvider<ProfileViewModel, void>
    profileViewModelProvider =
    StateNotifierProvider.autoDispose<ProfileViewModel, void>(
        (AutoDisposeStateNotifierProviderRef<ProfileViewModel, void> ref) {
  return ProfileViewModel();
});
