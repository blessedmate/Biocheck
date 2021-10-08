import 'package:biocheck_flutter/app/routes/app_pages.dart';
import 'package:get/get.dart';

class NewEvaluationController extends GetxController {
  final finished = false.obs;

  final val = ''.obs;
  final vale = ''.obs;

  List<String> options = ['Crswnp', 'JAIS', 'Hausa', 'Other'];
  List<String> optionsb = [
    'Crswnd',
    'Spfiax',
    'RRoxc',
    'TTreT',
    'Pobpy',
    'LoaYY',
    'MFghSC'
  ];

  showWarning(onChangeValue) {
    return onChangeValue.value == '' && finished.value;
  }

  submit() {
    finished.value = true;
    if (val.value != '' && vale.value != '') {
      Get.offAndToNamed(Routes.EVALUATIONS);
    }
  }
}
