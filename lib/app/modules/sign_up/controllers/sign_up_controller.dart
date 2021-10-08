import 'package:biocheck_flutter/app/routes/app_pages.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  submit() {
    Get.offAndToNamed(Routes.EVALUATIONS);
  }

  goToSignIn() {
    Get.offAndToNamed(Routes.SIGN_IN);
  }
}
