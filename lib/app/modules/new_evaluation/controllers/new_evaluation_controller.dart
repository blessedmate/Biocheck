import 'package:biocheck_flutter/app/global_widgets/controllers/main_controller.dart';
import 'package:biocheck_flutter/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:battery_plus/battery_plus.dart';

class NewEvaluationController extends GetxController {
  final finished = false.obs;
  Location location = Location();

  final val1 = ''.obs;
  final val2 = ''.obs;

  List<String> options1 = ['CRSwNP', 'AFRS', 'CRSwDD', 'Other'];
  List<String> options2 = [
    'Yes',
    'No',
  ];

  showWarning(onChangeValue) {
    return onChangeValue.value == '' && finished.value;
  }

  locationIsEnabled() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
  }

  submit() async {
    final mainController = Get.find<MainController>();
    print(mainController.startBatteryLevel);
    int finalBattery = await Battery().batteryLevel;
    print(finalBattery);
    print(await location.getLocation());

    finished.value = true;
    if (val1.value != '' && val2.value != '') {
      Get.offAndToNamed(Routes.EVALUATIONS);
    }
  }
}
