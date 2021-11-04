import 'package:battery_plus/battery_plus.dart';
import 'package:biocheck_flutter/app/data/models/evaluation.dart';
import 'package:biocheck_flutter/app/global_widgets/controllers/main_controller.dart';
import 'package:biocheck_flutter/app/modules/begin_evaluation/providers/templates_provider.dart';
import 'package:biocheck_flutter/app/routes/app_pages.dart';
import 'package:get/get.dart';

class BeginEvaluationController extends GetxController
    with StateMixin<List<Evaluation>> {
  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  loadData() async {
    change(null, status: RxStatus.loading());
    final provider = TemplatesProvider();
    // Response resp = await provider.getEvaluations();
    // List<Evaluation> list = evaluationFromJson(resp.body);
    // change(list, status: RxStatus.success());
    change([], status: RxStatus.success());
  }

  tapOnEvaluationItem() async {
    final mainController = Get.find<MainController>();
    mainController.startBatteryLevel = await Battery().batteryLevel;
    Get.toNamed(Routes.NEW_EVALUATION);
  }
}
