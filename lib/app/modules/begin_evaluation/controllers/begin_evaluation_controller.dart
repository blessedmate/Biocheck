import 'dart:math';

import 'package:battery_plus/battery_plus.dart';
import 'package:biocheck_flutter/app/data/models/evaluation.dart';
import 'package:biocheck_flutter/app/data/models/template.dart';
import 'package:biocheck_flutter/app/global_widgets/controllers/main_controller.dart';
import 'package:biocheck_flutter/app/modules/begin_evaluation/providers/templates_provider.dart';
import 'package:biocheck_flutter/app/providers/sqlite_provider.dart';
import 'package:biocheck_flutter/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BeginEvaluationController extends GetxController
    with StateMixin<List<Template>> {
  final templatesCollection =
      FirebaseFirestore.instance.collection('templates');

  List<Template> templates = [];
  List<Template> templatesCopy = [];

  @override
  void onInit() {
    super.onInit();
    loadTemplates();
  }

  loadData() async {
    change(null, status: RxStatus.loading());
    final provider = TemplatesProvider();
    change([], status: RxStatus.success());
  }

  search(String text) {
    if (text == '') {
      templates = templatesCopy;
    } else {
      templates = templates
          .where((element) =>
              element.title.toLowerCase().contains(text.toLowerCase()))
          .toList();
    }
  }

  // Load templates from local storage, then requests from backend
  loadTemplates() async {
    // Request templates from local DB first
    List<Template>? queriedTemplates = await SQLiteProvider.db.getTemplates();
    if (queriedTemplates != null) {
      print('got templates from sqlite');
      templates = queriedTemplates;
      change(templates, status: RxStatus.success());
    }

    // Get templates from backend
    try {
      final templatesFire = await templatesCollection.get();
      for (var e in templatesFire.docs) {
        Template current = Template.fromJson(e.data());
        current.id = getRandomString(32);
        templates.add(current);
      }
      templatesCopy = templates;
      SQLiteProvider.db.saveTemplates(templates);
      change([], status: RxStatus.success());
    } catch (e) {
      change(templates, status: RxStatus.success());
      Get.snackbar('No internet connection', 'Displaying older templates',
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 5));
    }
  }

  tapOnEvaluationItem() async {
    final mainController = Get.find<MainController>();
    mainController.startBatteryLevel = await Battery().batteryLevel;
    Get.toNamed(Routes.NEW_EVALUATION);
  }

  // Used to generate random ids
  String getRandomString(int length) {
    const _chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    Random _rnd = Random();
    return String.fromCharCodes(Iterable.generate(
        length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
  }
}
