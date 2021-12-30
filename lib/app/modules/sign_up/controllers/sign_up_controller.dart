// import 'package:biocheck_flutter/app/data/models/user.dart';
import 'package:biocheck_flutter/app/data/models/hospital.dart';
import 'package:biocheck_flutter/app/modules/sign_up/providers/auth_provider.dart';
import 'package:biocheck_flutter/app/routes/app_pages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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

  final _email = ''.obs;
  String get email => _email.value;
  set email(String newValue) => _email.value = newValue;

  final _name = ''.obs;
  String get name => _name.value;
  set name(String newValue) => _name.value = newValue;

  final _password = ''.obs;
  String get password => _password.value;
  set password(String newValue) => _password.value = newValue;

  final _specialty = ''.obs;
  String get specialty => _specialty.value;
  set specialty(String newValue) => _specialty.value = newValue;

  String message = '';

  final _dropDownValue = 'Select your hospital'.obs;
  String get dropDownValue => _dropDownValue.value;
  set dropDownValue(String newValue) => _dropDownValue.value = newValue;

  final hospitals = [].obs;

  CollectionReference hospitalsRef =
      FirebaseFirestore.instance.collection('hospitals');

  @override
  void onInit() {
    super.onInit();
    loadHospitals();
  }

  loadHospitals() async {
    final hospitalsDocs = (await hospitalsRef.get()).docs;
    hospitalsDocs.forEach((element) {
      final hosp = Hospital.fromJson(element.data() as Map<String, dynamic>);
      hospitals.add(hosp.name);
    });
  }

  signUp() async {
    //NO TODOS LOS DISPOSITIVOS SOPORTAN HUELLA ...
    loading = true;

    final provider = AuthProvider();

    try {
      await provider.signUp(email, password, specialty, dropDownValue, name);
      Get.snackbar('Succesful registration', 'Sign in to continue',
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 4));
      Get.offAllNamed(Routes.SIGN_IN);
    } catch (e) {
      error = true;
      message = e.toString().split(":")[1];
    }
    loading = false;
    update(['warning']);
  }

  goToSignIn() {
    Get.offAllNamed(Routes.SIGN_IN);
  }
}
