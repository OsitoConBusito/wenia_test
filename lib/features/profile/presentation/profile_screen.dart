part of com.wenia.test.features.profile.presentation;

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  static const String route = 'profile';

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  late final TextEditingController nameController;
  late final TextEditingController idController;
  late final TextEditingController birthdayController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    idController = TextEditingController();
    birthdayController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    idController.dispose();
    birthdayController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AsyncValue<UserModel> asyncValue =
        ref.watch(getProfileDataFutureProvider);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          t.profile.title.toUpperCase(),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: AppPaddings.medium,
          child: asyncValue.when(
            data: (UserModel data) {
              nameController.text = data.name ?? '';
              idController.text = data.id ?? '';
              birthdayController.text = data.birthday ?? '';
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    t.authentication.email.capitalizeFirst(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const Gap(AppSpacing.small),
                  Text(ref.read(autheticationViewModelProvider) ?? ''),
                  const Divider(),
                  Text(
                    t.authentication.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const Gap(AppSpacing.small),
                  CustomTextFormField(
                    labelText: '',
                    controller: nameController,
                  ),
                  const Divider(),
                  Text(
                    t.authentication.id,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const Gap(AppSpacing.small),
                  CustomTextFormField(
                    labelText: '',
                    controller: idController,
                  ),
                  const Divider(),
                  Text(
                    t.authentication.birthday,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const Gap(AppSpacing.small),
                  CustomTextFormField(
                    labelText: '',
                    controller: birthdayController,
                  ),
                  const Divider(),
                  const Gap(AppSpacing.xxLarge),
                  SizedBox(
                    width: double.infinity,
                    child: CustomElevatedButton(
                      text: t.profile.update_data,
                      onPressed: () {},
                    ),
                  ),
                  const Gap(AppSpacing.large),
                  SizedBox(
                    width: double.infinity,
                    child: CustomElevatedButton.secondary(
                      context: context,
                      text: t.authentication.restore_password,
                      onPressed: () {},
                    ),
                  ),
                ],
              );
            },
            error: (Object error, StackTrace stackTrace) => Text('Error'),
            loading: () => Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ),
      ),
    );
  }
}
