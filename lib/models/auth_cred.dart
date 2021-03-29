import 'dart:convert';

AuthCred authCredFromJson(String str) => AuthCred.fromJson(json.decode(str));

String authCredToJson(AuthCred data) => json.encode(data.toJson());

class AuthCred {
  AuthCred({
    this.email,
    this.password,
  });

  String email;
  String password;

  factory AuthCred.fromJson(Map<String, dynamic> json) => AuthCred(
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
      };
}
