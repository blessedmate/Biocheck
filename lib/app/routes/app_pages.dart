import 'package:get/get.dart';

import 'package:biocheck_flutter/app/modules/begin_evaluation/bindings/begin_evaluation_binding.dart';
import 'package:biocheck_flutter/app/modules/begin_evaluation/views/begin_evaluation_view.dart';
import 'package:biocheck_flutter/app/modules/home/bindings/home_binding.dart';
import 'package:biocheck_flutter/app/modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.BEGIN_EVALUATION,
      page: () => BeginEvaluationView(),
      binding: BeginEvaluationBinding(),
    ),
  ];
}
