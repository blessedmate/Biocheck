import 'package:biocheck_flutter/app/modules/sign_in/providers/auth_provider.dart';
import 'package:biocheck_flutter/app/routes/app_pages.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  final _loading = false.obs;
  bool get loading => _loading.value;
  set loading(bool newValue) => _loading.value = newValue;

  final _error = false.obs;
  bool get error => _error.value;
  set error(bool newValue) => _error.value = newValue;

  final _email = ''.obs;
  String get email => _email.value;
  set email(String newValue) => _email.value = newValue;

  final _password = ''.obs;
  String get password => _password.value;
  set password(String newValue) => _password.value = newValue;

  String message = '';

  signIn() async {
    error = true;
    loading = true;

    final provider = AuthProvider();
    Response resp = await provider.login(email, password);
    print(resp.body);
    if (resp.statusCode == 201) {
      Get.offAllNamed(Routes.EVALUATIONS);
    } else {
      error = true;
      message = resp.body['message'];
    }
    loading = false;
    update(['warning']);
  }
}
