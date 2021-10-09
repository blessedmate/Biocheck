import 'package:biocheck_flutter/app/data/models/question.dart';

import 'evaluation.dart';

class QuestionsGroup {
  QuestionsGroup({
    required this.id,
    required this.name,
    required this.questions,
  });

  int id;
  String name;
  List<Question> questions;

  factory QuestionsGroup.fromJson(Map<String, dynamic> json) => QuestionsGroup(
        id: json["id"],
        name: json["name"],
        questions: List<Question>.from(
            json["questions"].map((x) => Question.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "questions": List<dynamic>.from(questions.map((x) => x.toJson())),
      };
}
