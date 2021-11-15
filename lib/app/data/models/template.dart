import 'package:meta/meta.dart';
import 'dart:convert';

List<Template> templateFromJson(String str) =>
    List<Template>.from(json.decode(str).map((x) => Template.fromJson(x)));

String templateToJson(List<Template> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Template {
  Template({
    this.id,
    required this.title,
    required this.specialty,
    required this.questions,
  });

  String? id;
  String title;
  String specialty;
  List<dynamic> questions;

  factory Template.fromJson(Map<String, dynamic> json) => Template(
        title: json["title"],
        specialty: json["specialty"],
        questions: List<dynamic>.from(json["questions"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "specialty": specialty,
        "questions": List<dynamic>.from(questions.map((x) => x)),
      };
}
