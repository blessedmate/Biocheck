import 'dart:math';

import 'package:battery_plus/battery_plus.dart';
import 'package:biocheck_flutter/app/data/models/template.dart';
import 'package:biocheck_flutter/app/global_widgets/controllers/main_controller.dart';
import 'package:biocheck_flutter/app/providers/sqlite_provider.dart';
import 'package:biocheck_flutter/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BeginEvaluationController extends GetxController
    with StateMixin<List<Template>> {
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

  // Load templates from local storage, then requests from backend
  loadTemplates() async {
    // Request templates from local DB first
    List<Template>? queriedTemplates = await SQLiteProvider.db.getTemplates();
    if (queriedTemplates != null) {
      print('got templates from sqlite');
      templates.addAll(queriedTemplates);
      change(templates, status: RxStatus.success());
    }

    // Get templates from backend
    try {
      templates.clear();
      final templatesFire = await templatesCollection.get();
      for (var e in templatesFire.docs) {
        Template current = Template.fromJson(e.data());
        current.id = getRandomString(32);
        templates.add(current);
        templatesCopy.add(current);
      }
      SQLiteProvider.db.saveTemplates(templates);
      change([], status: RxStatus.success());
    } catch (e) {
      change(templates, status: RxStatus.success());
      Get.snackbar('No internet connection', 'Displaying older templates',
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 5));
    }
  }

  tapOnEvaluationItem(Template template) async {
    final mainController = Get.find<MainController>();
    mainController.startBatteryLevel = await Battery().batteryLevel;
    Get.toNamed(Routes.NEW_EVALUATION, arguments: template);
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
