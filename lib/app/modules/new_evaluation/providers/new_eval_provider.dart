import 'package:biocheck_flutter/app/data/models/models.dart';
import 'package:biocheck_flutter/config.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class NewEvaluationProvider extends GetConnect {
  final url = ConfigEnvironments.getUrl();

  Future<Evaluation> uploadEvaluation(
      Evaluation evaluation, String userId) async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    final history = users.doc(userId).collection('history');
    final body = {
      "user_id": evaluation.userId,
      "patient_firstName": evaluation.patientFirstName,
      "patient_lastName": evaluation.patientLastName,
      "due_date": evaluation.dueDate,
      "information": {"name": evaluation.template.name}
    };
    final resp = await history.add(body);

    return Evaluation.fromMap((await resp.get()).data()!);
  }
}
