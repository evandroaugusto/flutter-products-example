import 'package:app_referencia/src/features/users/domain/entity/geolocation.dart';

class Address {
  String city;
  String street;
  int number;
  String zipcode;
  Geolocation geolocation;

  Address({
    required this.city,
    required this.street,
    required this.number,
    required this.zipcode,
    required this.geolocation,
  });

  Map<String, dynamic> toMap() {
    return {
      'city': city,
      'street': street,
      'number': number,
      'zipcode': zipcode,
      'geolocation': geolocation.toMap(),
    };
  }

  factory Address.fromMap(Map<String, dynamic> map) {
    return Address(
      city: map['city'] ?? '',
      street: map['street'] ?? '',
      number: map['number']?.toInt() ?? 0,
      zipcode: map['zipcode'] ?? '',
      geolocation: Geolocation.fromMap(map['geolocation']),
    );
  }
}
