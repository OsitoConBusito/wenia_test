part of com.wenia.test.features.authentication.presentation;

class SignInScreen extends ConsumerStatefulWidget {
  const SignInScreen({super.key});

  static const String route = 'login';

  @override
  ConsumerState<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final AuthenticationViewModel viewModel;

  bool isPasswordVisible = false;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    viewModel = ref.read(autheticationViewModelProvider.notifier);
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(t.authentication.sign_in.capitalizeFirst())),
      body: Padding(
        padding: AppPaddings.medium,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Image.asset(
                AppImages.logo,
                width: MediaQuery.sizeOf(context).width * 0.5,
              ),
              CustomTextFormField(
                controller: emailController,
                labelText: t.authentication.email,
                keyboardType: TextInputType.emailAddress,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                textInputAction: TextInputAction.next,
                onChanged: (String value) {
                  setState(() {});
                },
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return t.authentication.empty_field;
                  } else {
                    return null;
                  }
                },
              ),
              const Gap(AppSpacing.large),
              CustomTextFormField(
                controller: passwordController,
                labelText: t.authentication.password,
                obscureText: !isPasswordVisible,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                textInputAction: TextInputAction.done,
                onChanged: (String value) {
                  setState(() {});
                },
                // onSubmitted: (String p0) async {
                //   if (emailController.text.trim().isEmpty ||
                //       passwordController.text.trim().isEmpty) {
                //     FocusManager.instance.primaryFocus?.unfocus();
                //     await viewModel.signIn(
                //       context: context,
                //       email: emailController.text.trim(),
                //       password: passwordController.text.trim(),
                //     );
                //   }
                // },
                suffixIcon: InkWell(
                  onTap: () {
                    setState(() {
                      isPasswordVisible = !isPasswordVisible;
                    });
                  },
                  child: Icon(
                    isPasswordVisible ? Icons.visibility_off : Icons.visibility,
                  ),
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return t.authentication.empty_field;
                  } else {
                    return null;
                  }
                },
              ),
              const Gap(AppSpacing.medium),
              SizedBox(
                width: MediaQuery.sizeOf(context).width,
                child: CustomElevatedButton(
                  onPressed: emailController.text.trim().isEmpty ||
                          passwordController.text.trim().isEmpty
                      ? null
                      : () async => viewModel.signIn(
                            context: context,
                            email: emailController.text.trim(),
                            password: passwordController.text.trim(),
                          ),
                  text: t.authentication.sign_in.toUpperCase(),
                ),
              ),
              const Gap(AppSpacing.xSmall),
              CustomTextButton(
                onPressed: () async {
                  await context.pushNamed(SignUpScreen.route);
                },
                text: t.authentication.already_account,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: AppPaddings.medium,
        child: CustomElevatedButton.secondary(
          context: context,
          onPressed: emailController.text.trim().isEmpty
              ? null
              : () async => viewModel.resetPassword(
                  context: context, email: emailController.text.trim()),
          text: t.authentication.restore_password,
        ),
      ),
    );
  }
}
