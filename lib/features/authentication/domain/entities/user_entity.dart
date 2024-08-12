part of com.wenia.test.features.authentication.entities;

class UserEntity {
  UserEntity({
    required this.id,
    required this.name,
    required this.birthday,
    required this.email,
  });

  final String id;
  final String name;
  final String birthday;
  final String email;
}
