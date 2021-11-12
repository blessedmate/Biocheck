import 'package:biocheck_flutter/app/data/models/models.dart';
import 'package:biocheck_flutter/app/modules/evaluations/providers/evaluations_provider.dart';
import 'package:biocheck_flutter/app/providers/sqlite_provider.dart';
import 'package:biocheck_flutter/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class EvaluationsController extends GetxController
    with StateMixin<List<Evaluation>> {
  final provider = EvaluationsProvider();
  List<Evaluation> evaluationsList = [];
  final _finished = true.obs;

  final box = GetStorage();

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

    final userId = box.read('userId');
    final token = box.read('token');

    // Request evaluations from local DB first
    List<Evaluation>? evals = await SQLiteProvider.db.getAllEvaluations();
    if (evals != null) {
      print('got evaluations from sqlite');
      evaluationsList = evals;
      change(evaluationsList, status: RxStatus.success());
    }

    // Request evaluations from backend
    else {
      final Response response = await provider.getEvaluations(userId, token);
      evaluationsList.clear();
      response.body.forEach((value) {
        final currentEval = Evaluation.fromMap(value);
        evaluationsList.add(currentEval);
      });

      if (evaluationsList.isEmpty) {
        change(evaluationsList, status: RxStatus.empty());
      } else {
        SQLiteProvider.db.saveEvaluations(evaluationsList);
        change(evaluationsList, status: RxStatus.success());
      }
    }
  }
}
