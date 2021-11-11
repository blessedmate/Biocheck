import 'package:biocheck_flutter/app/data/models/models.dart';
import 'package:biocheck_flutter/app/modules/evaluations/providers/evaluations_provider.dart';
import 'package:biocheck_flutter/app/routes/app_pages.dart';
import 'package:get/get.dart';

class EvaluationsController extends GetxController
    with StateMixin<List<Evaluation>> {
  final provider = EvaluationsProvider();
  final List<Evaluation> evaluationsList = [];
  final _finished = true.obs;

  @override
  void onInit() {
    super.onInit();
    getUserEvaluations();
  }

  beginEvaluation() {
    Get.toNamed(Routes.BEGIN_EVALUATION);
  }

  previousEvaluationDetail() {
    Get.toNamed(Routes.RISK_ASSESSMENT);
  }

  incompleteEvaluation() {
    return _finished.value;
  }

  // Requests the list of evaluations
  getUserEvaluations() async {
    change(null, status: RxStatus.loading());

    final Response response = await provider.getEvaluations();
    evaluationsList.clear();
    response.body.forEach((value) {
      final currentEval = Evaluation.fromMap(value);
      evaluationsList.add(currentEval);
    });
    if (evaluationsList.isEmpty) {
      change(evaluationsList, status: RxStatus.empty());
    } else {
      change(evaluationsList, status: RxStatus.success());
    }

    // TODO: Save to SQLite
  }
}
