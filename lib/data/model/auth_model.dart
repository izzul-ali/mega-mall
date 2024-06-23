class Auth {
  final String emailOrPhoneNumber;
  final String password;

  Auth({
    required this.emailOrPhoneNumber,
    required this.password,
  });

  Auth copyWith({
    String? emailOrPhoneNumber,
    String? password,
  }) =>
      Auth(
        emailOrPhoneNumber: emailOrPhoneNumber ?? this.emailOrPhoneNumber,
        password: password ?? this.password,
      );

  factory Auth.fromMap(Map<String, dynamic> json) => Auth(
        emailOrPhoneNumber: json["emailOrPhoneNumber"],
        password: json["password"],
      );

  Map<String, dynamic> toMap() => {
        "emailOrPhoneNumber": emailOrPhoneNumber,
        "password": password,
      };
}
