// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProfileReqModel {
  String email;
  String password;
  String confirmPassword;

 ProfileReqModel({
    required this.email,
    required this.password,
    required this.confirmPassword,
  });

  static ProfileReqModel getInstance() {
    return ProfileReqModel(
      email: "",
      password: "",
      confirmPassword: "",
    );
  }

ProfileReqModel copyWith({
    String? email,
    String? password,
    String? confirmPassword,
  }) {
    return ProfileReqModel(
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'password': password,
      'confirmPassword': confirmPassword,
    };
  }

  factory ProfileReqModel.fromMap(Map<String, dynamic> map) {
    return ProfileReqModel(
      email: map['email'] != null ? map['email'] as String : '',
      password: map['password'] != null ? map['password'] as String : '',
      confirmPassword:
          map['confirmPassword'] != null ? map['confirmPassword'] as String : '',
    );
  }

  /// Checks if the password and confirmPassword match
  bool get isPasswordMatch => password == confirmPassword;
}
