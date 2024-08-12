part of com.wenia.test.features.authentication.model;

class UserModel {
  UserModel({
    this.birthday,
    this.email,
    this.id,
    this.name,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        name: json['name'],
        birthday: json['birthday'],
        id: json['id'],
        email: json['email'],
      );

  final String? email;
  final String? name;
  final String? id;
  final String? birthday;

  Map<String, dynamic> get toJson {
    return <String, dynamic>{
      'birthday': birthday,
      'email': email,
      'id': id,
      'name': name,
    };
  }

  copyWith({
    String? birthday,
    String? email,
    String? id,
    String? name,
  }) =>
      UserModel(
        birthday: birthday ?? this.birthday,
        email: email ?? this.email,
        id: id ?? this.id,
        name: name ?? this.name,
      );
}
