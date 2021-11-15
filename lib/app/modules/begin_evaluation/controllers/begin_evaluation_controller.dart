import 'package:battery_plus/battery_plus.dart';
import 'package:biocheck_flutter/app/data/models/evaluation.dart';
import 'package:biocheck_flutter/app/data/models/template.dart';
import 'package:biocheck_flutter/app/global_widgets/controllers/main_controller.dart';
import 'package:biocheck_flutter/app/modules/begin_evaluation/providers/templates_provider.dart';
import 'package:biocheck_flutter/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BeginEvaluationController extends GetxController
    with StateMixin<List<Evaluation>> {
  final templatesCollection =
      FirebaseFirestore.instance.collection('templates');

  RxList<Template> templates = RxList<Template>();
  RxList<Template> templatesCopy = RxList<Template>();

  @override
  void onInit() {
    super.onInit();
    loadTemplates();
  }

  search(String text) {
    if (text == '') {
      templates.addAll(templatesCopy);
    } else {
      templates.value = templates
          .where((element) =>
              element.title.toLowerCase().contains(text.toLowerCase()))
          .toList();
    }
  }

  loadTemplates() async {
    final templatesFire = await templatesCollection.get();
    for (var e in templatesFire.docs) {
      templates.add(Template.fromJson(e.data()));
      templatesCopy.add(Template.fromJson(e.data()));
    }
    // templatesCopy = templates;
    change([], status: RxStatus.success());
  }

  tapOnEvaluationItem(Template template) async {
    final mainController = Get.find<MainController>();
    mainController.startBatteryLevel = await Battery().batteryLevel;
    Get.toNamed(Routes.NEW_EVALUATION, arguments: template);
  }
}
