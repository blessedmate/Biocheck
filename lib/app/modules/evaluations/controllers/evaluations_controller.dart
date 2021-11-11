import 'package:biocheck_flutter/app/data/models/models.dart';
import 'package:biocheck_flutter/app/modules/evaluations/providers/evaluations_provider.dart';
import 'package:biocheck_flutter/app/routes/app_pages.dart';
import 'package:get/get.dart';

class EvaluationsController extends GetxController {
  final provider = EvaluationsProvider();
  final List<Evaluation> evaluationsList = [];
  final _finished = true.obs;

  beginEvaluation() {
    Get.toNamed(Routes.BEGIN_EVALUATION);
  }

  previousEvaluationDetail() {
    Get.toNamed(Routes.RISK_ASSESSMENT);
  }

  incompleteEvaluation() {
    return _finished.value;
  }

  getUserEvaluations() async {
    // Requests the list of evaluations
    final Response response = await provider.getEvaluations();

    response.body.forEach((value) {
      final currentEval = Evaluation.fromMap(value);
      evaluationsList.add(currentEval);
    });
    // TODO: Return evaluations and display dynamically

    print(response.statusCode);
    print(response.body);
  }
}
