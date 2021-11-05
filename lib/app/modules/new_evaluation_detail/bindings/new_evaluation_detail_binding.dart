import 'package:get/get.dart';

import '../controllers/new_evaluation_detail_controller.dart';

class NewEvaluationDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewEvaluationDetailController>(
      () => NewEvaluationDetailController(),
    );
  }
}
