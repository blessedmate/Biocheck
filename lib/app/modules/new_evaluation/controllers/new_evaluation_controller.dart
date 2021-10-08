import 'package:get/get.dart';

class NewEvaluationController extends GetxController {
  List<String> options = ['Crswnp', 'Other', 'hausua', 'jaijais'];
  List<String> optionsb = [
    'Crswnp',
    'zzz',
    'hola',
    'sapa',
    'Crswnp',
    'zzz',
    'impar'
  ];
  // List<String> optionsb = ['QIJISIQ', 'WDADS', 'hAWAD', 'ASDDA'];
  // List<RxString> streams = [];
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
