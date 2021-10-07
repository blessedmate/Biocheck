import 'package:get/get.dart';

import '../controllers/begin_evaluation_controller.dart';

class BeginEvaluationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BeginEvaluationController>(
      () => BeginEvaluationController(),
    );
  }
}
