class Question {
  Question({
    required this.id,
    required this.text,
  });

  int id;
  String text;

  factory Question.fromJson(Map<String, dynamic> json) => Question(
        id: json["id"],
        text: json["text"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "text": text,
      };
}
