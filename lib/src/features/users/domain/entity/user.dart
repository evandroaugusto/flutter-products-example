import 'package:app_referencia/src/features/users/domain/entity/address.dart';
import 'package:app_referencia/src/features/users/domain/entity/name.dart';

class User {
  int id;
  String email;
  String username;
  String password;
  Name name;
  Address address;
  String phone;

  User({
    required this.id,
    required this.email,
    required this.username,
    required this.password,
    required this.name,
    required this.address,
    required this.phone,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'username': username,
      'password': password,
      'name': name.toMap(),
      'address': address.toMap(),
      'phone': phone,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id']?.toInt() ?? 0,
      email: map['email'] ?? '',
      username: map['username'] ?? '',
      password: map['password'] ?? '',
      name: Name.fromMap(map['name']),
      address: Address.fromMap(map['address']),
      phone: map['phone'] ?? '',
    );
  }
}
