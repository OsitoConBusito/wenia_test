part of com.wenia.test.features.authentication.presentation;

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});

  static const String route = 'sign_up';

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  late final AuthenticationViewModel viewModel;
  late final TextEditingController nameController;
  late final TextEditingController passwordController;
  late final TextEditingController emailController;
  late final TextEditingController idController;
  late final TextEditingController birthdayController;

  bool isPasswordVisible = false;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    passwordController = TextEditingController();
    emailController = TextEditingController();
    idController = TextEditingController();
    birthdayController = TextEditingController();
    viewModel = ref.read(autheticationViewModelProvider.notifier);
  }

  @override
  void dispose() {
    nameController.dispose();
    passwordController.dispose();
    emailController.dispose();
    idController.dispose();
    birthdayController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(t.authentication.sign_up.capitalizeEach()),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: AppPaddings.medium,
          child: Form(
            key: formkey,
            child: Column(
              children: <Widget>[
                Image.asset(
                  AppImages.logo,
                  width: MediaQuery.sizeOf(context).width * 0.5,
                ),
                const Gap(AppSpacing.large),
                CustomTextFormField(
                  labelText: t.authentication.email.capitalizeFirst(),
                  controller: emailController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return t.authentication.empty_field;
                    } else if (!value.isValidEmail) {
                      return t.authentication.not_valid_email;
                    } else {
                      return null;
                    }
                  },
                ),
                const Gap(AppSpacing.medium),
                CustomTextFormField(
                  labelText: t.authentication.name,
                  controller: nameController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.name,
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return t.authentication.empty_field;
                    } else {
                      return null;
                    }
                  },
                ),
                const Gap(AppSpacing.medium),
                CustomTextFormField(
                  labelText: t.authentication.password.capitalizeFirst(),
                  controller: passwordController,
                  obscureText: !isPasswordVisible,
                  suffixIcon: InkWell(
                    onTap: () {
                      isPasswordVisible = !isPasswordVisible;
                      setState(() {});
                    },
                    child: isPasswordVisible
                        ? const Icon(Icons.visibility_off)
                        : const Icon(
                            Icons.visibility,
                          ),
                  ),
                  textInputAction: TextInputAction.next,
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return t.authentication.empty_field;
                    } else if (!value.isValidPassword) {
                      return t.authentication.not_valid_password;
                    } else {
                      return null;
                    }
                  },
                ),
                const Gap(AppSpacing.medium),
                CustomTextFormField(
                  labelText: t.authentication.id,
                  controller: idController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return t.authentication.empty_field;
                    } else {
                      return null;
                    }
                  },
                ),
                const Gap(AppSpacing.medium),
                InkWell(
                  onTap: () async {
                    final DateTime? result = await showDatePicker(
                      context: context,
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now(),
                    );
                    if (result != null) {
                      birthdayController.text = result.formatDateTime;
                      setState(() {});
                    }
                  },
                  child: CustomTextFormField(
                    labelText: t.authentication.birthday,
                    controller: birthdayController,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.done,
                    enabled: false,
                    suffixIcon: Icon(
                      Icons.calendar_today,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: AppPaddings.medium,
        child: CustomElevatedButton(
          text: t.authentication.sign_up,
          onPressed: () async {
            if (formkey.currentState!.validate()) {
              if (!birthdayController
                  .text.convertToDateTime!.isAtLeast18YearsOld) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(t.authentication.must_be_18),
                    backgroundColor: Theme.of(context).colorScheme.error,
                    duration: AppDurations.snackBarDuration,
                    behavior: SnackBarBehavior.floating,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppSpacing.small),
                    ),
                    margin: const EdgeInsets.all(AppSpacing.medium),
                  ),
                );
              } else {
                await viewModel.signUp(
                  birthday: birthdayController.text,
                  context: context,
                  email: emailController.text.trim(),
                  id: idController.text.trim(),
                  name: nameController.text.trim(),
                  password: passwordController.text.trim(),
                );
              }
            }
          },
        ),
      ),
    );
  }
}
