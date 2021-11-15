// To parse this JSON data, do
//
//     final evaluation = evaluationFromJson(jsonString);

import 'package:biocheck_flutter/app/data/models/eval_response.dart';
import 'dart:convert';

import 'models.dart';

class Evaluation {
  Evaluation({
    this.id,
    required this.userId,
    required this.patientFirstName,
    required this.patientLastName,
    required this.dueDate,
    required this.template,
    this.response,
    this.sent,
  });

  String? id;
  int userId;
  String patientFirstName;
  String patientLastName;
  String dueDate;
  EvaluationTemplate template;
  EvalResponse? response;
  bool? sent;

  factory Evaluation.fromJson(String str) =>
      Evaluation.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Evaluation.fromMap(Map<String, dynamic> json) => Evaluation(
        id: json["_id"],
        userId: json["user_id"],
        patientFirstName: json["patient_firstName"],
        patientLastName: json["patient_lastName"],
        dueDate: json["due_date"],
        template: EvaluationTemplate.fromMap(json["information"]),
        sent: json["sent"] ?? true,
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "user_id": userId,
        "patient_firstName": patientFirstName,
        "patient_lastName": patientLastName,
        "due_date": dueDate,
        "information": template.toMap(),
      };
}
