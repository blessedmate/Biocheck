import 'package:get/get.dart';

import 'package:biocheck_flutter/app/modules/begin_evaluation/bindings/begin_evaluation_binding.dart';
import 'package:biocheck_flutter/app/modules/begin_evaluation/views/begin_evaluation_view.dart';
import 'package:biocheck_flutter/app/modules/evaluations/bindings/evaluations_binding.dart';
import 'package:biocheck_flutter/app/modules/evaluations/views/evaluations_view.dart';
import 'package:biocheck_flutter/app/modules/home/bindings/home_binding.dart';
import 'package:biocheck_flutter/app/modules/home/views/home_view.dart';
import 'package:biocheck_flutter/app/modules/new_evaluation/bindings/new_evaluation_binding.dart';
import 'package:biocheck_flutter/app/modules/new_evaluation/views/new_evaluation_view.dart';
import 'package:biocheck_flutter/app/modules/new_evaluation_detail/bindings/new_evaluation_detail_binding.dart';
import 'package:biocheck_flutter/app/modules/new_evaluation_detail/views/new_evaluation_detail_view.dart';
import 'package:biocheck_flutter/app/modules/risk_assessment/bindings/risk_assessment_binding.dart';
import 'package:biocheck_flutter/app/modules/risk_assessment/views/risk_assessment_view.dart';
import 'package:biocheck_flutter/app/modules/sign_in/bindings/sign_in_binding.dart';
import 'package:biocheck_flutter/app/modules/sign_in/views/sign_in_view.dart';
import 'package:biocheck_flutter/app/modules/sign_up/bindings/sign_up_binding.dart';
import 'package:biocheck_flutter/app/modules/sign_up/views/sign_up_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SIGN_UP;

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
    GetPage(
      name: _Paths.SIGN_UP,
      page: () => SignUpView(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: _Paths.RISK_ASSESSMENT,
      page: () => RiskAssessmentView(),
      binding: RiskAssessmentBinding(),
    ),
    GetPage(
      name: _Paths.NEW_EVALUATION_DETAIL,
      page: () => NewEvaluationDetailView(),
      binding: NewEvaluationDetailBinding(),
    ),
  ];
}
