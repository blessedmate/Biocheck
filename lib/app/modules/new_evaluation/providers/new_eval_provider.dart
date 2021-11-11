import 'package:biocheck_flutter/app/data/models/models.dart';
import 'package:biocheck_flutter/config.dart';
import 'package:get/get.dart';

class NewEvaluationProvider extends GetConnect {
  final url = ConfigEnvironments.getUrl();

  uploadEvaluation(Evaluation evaluation) async {
    final uri = Uri.https(url, 'Beta/forms');
    final body = {
      "user_id": evaluation.userId,
      "patient_firstName": evaluation.patientFirstName,
      "patient_lastName": evaluation.patientLastName,
      "due_date": evaluation.dueDate,
      "information": {"name": "Adenoidectomy"}
    };
    final headers = {
      "access-token":
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjaGVjayI6dHJ1ZSwiaWF0IjoxNjM2NTA5MjIyfQ.Tx3hS2NBDvMbNUmY-H3-otM5QfZwWPAv08jIjO4T644',
    };
    return await post(uri.toString(), body, headers: headers);
  }
}
