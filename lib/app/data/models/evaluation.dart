// To parse this JSON data, do
//
//     final evaluation = evaluationFromJson(jsonString);

import 'package:biocheck_flutter/app/data/models/eval_response.dart';
import 'package:biocheck_flutter/app/data/models/questions_group.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

List<Evaluation> evaluationFromJson(dynamic str) =>
    List<Evaluation>.from(str.map((x) => Evaluation.fromJson(x)));

String evaluationToJson(List<Evaluation> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Evaluation {
  Evaluation({
    required this.id,
    required this.name,
    required this.specialty,
    required this.questionsGroup,
    required this.response,
  });

  int id;
  String name;
  String specialty;
  List<QuestionsGroup> questionsGroup;
  EvalResponse? response;

  factory Evaluation.fromJson(Map<String, dynamic> json) => Evaluation(
      id: json["id"],
      name: json["name"],
      specialty: json["specialty"],
      questionsGroup: List<QuestionsGroup>.from(
          json["questionsGroup"].map((x) => QuestionsGroup.fromJson(x))),
      response: json["response"] != null
          ? EvalResponse.fromJson(json["response"])
          : null);

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "specialty": specialty,
        "questionsGroup":
            List<dynamic>.from(questionsGroup.map((x) => x.toJson())),
        "response": response?.toJson(),
      };
}
