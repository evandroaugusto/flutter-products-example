class Name {
  String firstname;
  String lastname;

  Name({required this.firstname, required this.lastname});

  get fullname => '$firstname $lastname';

  Map<String, dynamic> toMap() {
    return {
      'firstname': firstname,
      'lastname': lastname,
    };
  }

  factory Name.fromMap(Map<String, dynamic> map) {
    return Name(
      firstname: map['firstname'] ?? '',
      lastname: map['lastname'] ?? '',
    );
  }
}
