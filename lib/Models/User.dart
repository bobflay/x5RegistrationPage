class User {
  final String name;
  final String email;
  final String phone;
  final String? country;
  final String? password;


  User({
    required this.name,
    required this.email,
    required this.phone,
    this.country,
    this.password
  });


}