class Geolocation {
  String lat;
  String lng;

  Geolocation({required this.lat, required this.lng});

  Map<String, dynamic> toMap() {
    return {
      'lat': lat,
      'lng': lng,
    };
  }

  factory Geolocation.fromMap(Map<String, dynamic> map) {
    return Geolocation(
      lat: map['lat'] ?? '',
      lng: map['lng'] ?? '',
    );
  }
}
