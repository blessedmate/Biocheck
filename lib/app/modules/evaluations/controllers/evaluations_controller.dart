import 'package:biocheck_flutter/app/routes/app_pages.dart';
import 'package:get/get.dart';

class EvaluationsController extends GetxController {
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
}
