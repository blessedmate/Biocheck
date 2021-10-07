import 'package:get/get.dart';

class BeginEvaluationController extends GetxController {
  //TODO: Implement BeginEvaluationController

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
