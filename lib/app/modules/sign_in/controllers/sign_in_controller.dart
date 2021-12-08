import 'package:biocheck_flutter/app/modules/sign_in/providers/auth_provider.dart';
import 'package:biocheck_flutter/app/routes/app_pages.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';
import 'package:get_storage/get_storage.dart';

class SignInController extends GetxController {
  final box = GetStorage();

  final _loading = false.obs;
  bool get loading => _loading.value;
  set loading(bool newValue) => _loading.value = newValue;

  final _error = false.obs;
  bool get error => _error.value;
  set error(bool newValue) => _error.value = newValue;

  final _username = ''.obs;
  String get username => _username.value;
  set username(String newValue) => _username.value = newValue;

  final _password = ''.obs;
  String get password => _password.value;
  set password(String newValue) => _password.value = newValue;

  String message = '';

  signIn() async {
    error = true;
    loading = true;

    final provider = AuthProvider();
    try {
      final user = await provider.login(username, password);
      box.write('userId', user?.user?.uid);
      Get.offAllNamed(Routes.EVALUATIONS);
    } catch (e) {
      error = true;
      print(e);
      message = e.toString().split(":")[1];
    }
    // Response resp = await provider.login(username, password);

    // if (resp.statusCode == 200) {
    //   Get.offAllNamed(Routes.EVALUATIONS);
    //   box.write('token', resp.body['token']);
    //   box.write('userId', resp.body['data']['id']);
    // } else {
    //   error = true;
    //   message = resp.body['message'];
    // }
    loading = false;
    update(['warning']);
  }

  fingerCheck() {
    Get.toNamed(Routes.EVALUATIONS);
  }

  static final _auth = LocalAuthentication();

  static Future<bool> hasBiometrics() async {
    try {
      return await _auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      return false;
      //TODO: No previous fingerprint message
    }
  }

  Future<bool> authenticate() async {
    final isAvailable = await hasBiometrics();
    if (!isAvailable) return false;
    try {
      return await _auth.authenticate(
        biometricOnly: true,
        localizedReason: 'Scan Fingerprint to Authenticate',
        useErrorDialogs: true,
        stickyAuth: true,
      );
    } on PlatformException catch (e) {
      return false;
    }
  }

  goToSignUp() {
    Get.offAllNamed(Routes.SIGN_UP);
  }
}
