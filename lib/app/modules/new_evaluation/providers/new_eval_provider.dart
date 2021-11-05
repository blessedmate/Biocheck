import 'package:biocheck_flutter/config.dart';
import 'package:get/get.dart';

class NewEvaluationProvider extends GetConnect {
  final url = ConfigEnvironments.getUrl();

  uploadEvaluation(String firstName, String lastName, String dueDate) async {
    final uri = Uri.https(url, 'Beta/forms');
    final body = {
      "user_id": 37,
      "patient_firstName": firstName,
      "patient_lastName": lastName,
      "due_date": dueDate,
      "information": {"name": "Cardio", "bpm": 120}
    };
    final headers = {
      "access-token": '',
    };
    return await post(uri.toString(), body, headers: headers);
  }
}
