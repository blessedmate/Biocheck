import 'package:get/get.dart';

import '../controllers/evaluations_controller.dart';

class EvaluationsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EvaluationsController>(
      () => EvaluationsController(),
    );
  }
}
