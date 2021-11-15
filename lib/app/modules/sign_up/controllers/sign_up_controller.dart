import 'package:biocheck_flutter/app/modules/sign_up/providers/auth_provider.dart';
import 'package:biocheck_flutter/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SignUpController extends GetxController {
  final box = GetStorage();

  final _loading = false.obs;
  bool get loading => _loading.value;
  set loading(bool newValue) => _loading.value = newValue;

  final _error = false.obs;
  bool get error => _error.value;
  set error(bool newValue) => _error.value = newValue;

  final _name = ''.obs;
  String get name => _name.value;
  set name(String newValue) => _name.value = newValue;

  final _username = ''.obs;
  String get username => _username.value;
  set username(String newValue) => _username.value = newValue;

  final _email = ''.obs;
  String get email => _email.value;
  set email(String newValue) => _email.value = newValue;

  final _institution = ''.obs;
  String get institution => _institution.value;
  set institution(String newValue) => _institution.value = newValue;

  final _password = ''.obs;
  String get password => _password.value;
  set password(String newValue) => _password.value = newValue;

  String message = '';

  signUp() async {
    //NO TODOS LOS DISPOSITIVOS SOPORTAN HUELLA ...
    loading = true;

    final provider = AuthProvider();

    if (username == '') {
      error = true;
      message = 'Username can\'t be empty';
    } else if (email == '') {
      error = true;
      message = 'Email can\'t be empty';
    } else if (password == '') {
      error = true;
      message = 'Password can\'t be empty';
    }
    if (!error) {
      Response resp =
          await provider.signUp(name, email, username, password, institution);
      if (resp.statusCode == 200) {
        Get.offAndToNamed(Routes.SIGN_IN);
        Get.snackbar('Succesful registration', 'Sign in to continue',
            snackPosition: SnackPosition.BOTTOM,
            duration: const Duration(seconds: 4));
      } else {
        error = true;
        message = resp.body['message'];
      }
    }
    loading = false;
    update(['warning']);
  }

  goToSignIn() {
    Get.offAndToNamed(Routes.SIGN_IN);
  }
}
