import 'package:biocheck_flutter/app/data/models/models.dart';
import 'package:biocheck_flutter/config.dart';
import 'package:get/get.dart';

class NewEvaluationProvider extends GetConnect {
  final url = ConfigEnvironments.getUrl();

  uploadEvaluation(Evaluation evaluation, String token) async {
    final uri = Uri.https(url, 'Beta/forms');
    final body = {
      "user_id": evaluation.userId,
      "patient_firstName": evaluation.patientFirstName,
      "patient_lastName": evaluation.patientLastName,
      "due_date": evaluation.dueDate,
      "information": {"name": evaluation.template.name}
    };
    final headers = {
      "access-token": token,
    };
    return await post(uri.toString(), body, headers: headers);
  }
}
