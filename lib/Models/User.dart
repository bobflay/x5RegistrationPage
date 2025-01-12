import 'dart:convert';

class User {
  final String? name;
  final String email;
  final String? phone;
  final String? country;
  final String? password;

  User(
      {this.name,
      required this.email,
      this.phone,
      this.country,
      this.password});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'country': country,
      'password': password
    };
  }

  String toJson() => json.encode(toMap());
}
