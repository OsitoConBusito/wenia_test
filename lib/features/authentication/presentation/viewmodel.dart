part of com.wenia.test.features.authentication.presentation;

class AuthenticationViewModel extends CustomViewModel<String> {
  AuthenticationViewModel() : super('');

  Future<void> signIn({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      showLoading(context);

      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      state = email;

      if (context.mounted) {
        context.go('/${ListScreen.route}');
      }
    } on FirebaseAuthException catch (_) {
      if (context.mounted) {
        showErrorSnackbar(context: context);
      }
    } finally {
      if (context.mounted) {
        closeLoading(context);
      }
    }
  }

  Future<void> signUp({
    required BuildContext context,
    required String birthday,
    required String email,
    required String id,
    required String password,
    required String name,
  }) async {
    try {
      showLoading(context);

      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await FirebaseFirestore.instance
          .collection(FirebaseCollections.users)
          .add(
            UserModel(
              birthday: birthday,
              email: email,
              id: id,
              name: name,
            ).toJson,
          );
      if (context.mounted) {
        showSnackbar(
          context: context,
          message: t.authentication.successfuly_user_created,
        );
        context.pop();
      }
    } on FirebaseAuthException catch (_) {
      if (context.mounted) {
        showErrorSnackbar(
          context: context,
          onPressed: () async =>
              signIn(context: context, email: email, password: password),
        );
      }
    } finally {
      if (context.mounted) {
        closeLoading(context);
      }
    }
  }

  Future<void> resetPassword(
      {required BuildContext context, required String email}) async {
    try {
      showLoading(context);
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: email,
      );
      if (context.mounted) {
        showSnackbar(
          context: context,
          message: t.authentication.restored_password,
        );
      }
    } catch (e) {
      if (context.mounted) {
        showErrorSnackbar(context: context);
      }
    } finally {
      if (context.mounted) {
        closeLoading(context);
      }
    }
  }

  bool isAuthenticated() {
    return FirebaseAuth.instance.currentUser != null;
  }
}
