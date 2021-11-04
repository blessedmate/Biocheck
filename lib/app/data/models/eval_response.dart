class EvalResponse {
  EvalResponse({
    required this.id,
    required this.status,
    required this.startBattery,
    required this.endBattery,
  });

  int id;
  String status;
  int startBattery;
  int endBattery;

  factory EvalResponse.fromJson(Map<String, dynamic> json) => EvalResponse(
        id: json["id"],
        status: json["status"],
        startBattery: json["startBattery"],
        endBattery: json["endBattery"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "status": status,
        "startBattery": startBattery,
        "endBattery": endBattery,
      };
}
