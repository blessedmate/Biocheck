import 'package:get/get.dart';

import '../controllers/risk_assessment_controller.dart';

class RiskAssessmentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RiskAssessmentController>(
      () => RiskAssessmentController(),
    );
  }
}
