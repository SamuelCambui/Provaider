// models/user.dart
class User {
  String name;
  String email;
  String password;
  String country;
  String city;
  String cep;
  String address;

  User({
    required this.name,
    required this.email,
    required this.password,
    required this.country,
    required this.city,
    required this.cep,
    required this.address,
  });
}
