// To parse this JSON data, do
//
//     final user = userFromMap(jsonString);

import 'dart:convert';

class User {
  User({
    required this.specialty,
    this.imageUrl,
    required this.name,
    required this.hospital,
    required this.email,
  });

  String specialty;
  String? imageUrl;
  String name;
  Hospital hospital;
  String email;

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
        specialty: json["specialty"],
        imageUrl: json["imageUrl"],
        name: json["name"],
        hospital: Hospital.fromMap(json["hospital"]),
        email: json["email"],
      );

  Map<String, dynamic> toMap() => {
        "specialty": specialty,
        "imageUrl": imageUrl,
        "name": name,
        "hospital": hospital.toMap(),
        "email": email,
      };
}

class Hospital {
  Hospital({
    required this.name,
    required this.id,
  });

  String name;
  String id;

  factory Hospital.fromJson(String str) => Hospital.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Hospital.fromMap(Map<String, dynamic> json) => Hospital(
        name: json["name"],
        id: json["id"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "id": id,
      };
}
