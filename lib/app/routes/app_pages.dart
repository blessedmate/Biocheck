import 'package:get/get.dart';

import 'package:biocheck_flutter/app/modules/begin_evaluation/bindings/begin_evaluation_binding.dart';
import 'package:biocheck_flutter/app/modules/begin_evaluation/views/begin_evaluation_view.dart';
import 'package:biocheck_flutter/app/modules/evaluations/bindings/evaluations_binding.dart';
import 'package:biocheck_flutter/app/modules/evaluations/views/evaluations_view.dart';
import 'package:biocheck_flutter/app/modules/home/bindings/home_binding.dart';
import 'package:biocheck_flutter/app/modules/home/views/home_view.dart';
import 'package:biocheck_flutter/app/modules/new_evaluation/bindings/new_evaluation_binding.dart';
import 'package:biocheck_flutter/app/modules/new_evaluation/views/new_evaluation_view.dart';
import 'package:biocheck_flutter/app/modules/sign_in/bindings/sign_in_binding.dart';
import 'package:biocheck_flutter/app/modules/sign_in/views/sign_in_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SIGN_IN;

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
    GetPage(
      name: _Paths.SIGN_IN,
      page: () => SignInView(),
      binding: SignInBinding(),
    ),
    GetPage(
      name: _Paths.EVALUATIONS,
      page: () => EvaluationsView(),
      binding: EvaluationsBinding(),
    ),
    GetPage(
      name: _Paths.NEW_EVALUATION,
      page: () => NewEvaluationView(),
      binding: NewEvaluationBinding(),
    ),
  ];
}
