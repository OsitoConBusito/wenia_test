part of com.wenia.test.features.profile.presentation;

class ProfileViewModel extends StateNotifier<UserModel> {
  ProfileViewModel() : super(UserModel());

  Future<UserModel> getProfileData() async {
    try {
      final CollectionReference<Map<String, dynamic>> users =
          FirebaseFirestore.instance.collection(FirebaseCollections.users);

      QuerySnapshot<dynamic> querySnapshot = await users
          .where('email', isEqualTo: FirebaseAuth.instance.currentUser!.email)
          .get();

      return UserModel.fromJson(
          querySnapshot.docs.first.data() as Map<String, dynamic>);
    } catch (e) {
      rethrow;
    }
  }
}
