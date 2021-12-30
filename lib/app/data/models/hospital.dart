import 'dart:convert';

List<Hospital> hospitalFromJson(List list) =>
    List<Hospital>.from(list.map((x) => Hospital.fromJson(x)));

String hospitalToJson(List<Hospital> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Hospital {
  Hospital({
    required this.id,
    required this.name,
  });

  String id;
  String name;

  factory Hospital.fromJson(Map<String, dynamic> json) => Hospital(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
