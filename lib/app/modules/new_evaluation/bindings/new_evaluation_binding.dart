import 'package:get/get.dart';

import '../controllers/new_evaluation_controller.dart';

class NewEvaluationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewEvaluationController>(
      () => NewEvaluationController(),
    );
  }
}
