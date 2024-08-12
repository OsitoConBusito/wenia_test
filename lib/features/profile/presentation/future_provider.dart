part of com.wenia.test.features.profile.presentation;

final FutureProvider<UserModel> getProfileDataFutureProvider =
    FutureProvider<UserModel>((FutureProviderRef<UserModel> ref) async {
  return ref.read(profileViewModelProvider.notifier).getProfileData();
});
