import 'dart:convert';

class EvaluationTemplate {
  EvaluationTemplate({
    required this.name,
  });

  String name;

  factory EvaluationTemplate.fromJson(String str) =>
      EvaluationTemplate.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory EvaluationTemplate.fromMap(Map<String, dynamic> json) =>
      EvaluationTemplate(
        name: json["name"] ?? '',
      );

  Map<String, dynamic> toMap() => {
        "name": name,
      };
}
