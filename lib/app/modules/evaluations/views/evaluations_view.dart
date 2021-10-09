import 'package:biocheck_flutter/app/routes/app_pages.dart';
import 'package:biocheck_flutter/app/utils/palette.dart';
import 'package:biocheck_flutter/app/utils/typography_styles.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/evaluations_controller.dart';

class EvaluationsView extends GetView<EvaluationsController> {
  AppBar appbar = AppBar(
    leading: TextButton(
      onPressed: () {},
      child: const Icon(
        Icons.menu,
        color: Palette.primaryColor,
        size: 30,
      ),
      style: TextButton.styleFrom(
        primary: Colors.white,
        elevation: 0,
      ),
    ),
    title: const Text(
      'BioCheck',
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar,
      body: Column(
        children: [
          _beginEvaluationButton(context),
          _evaluationsList(),
        ],
      ),
    );
  }

  Widget _beginEvaluationButton(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
      width: double.infinity,
      height: 65,
      // color: Colors.green,
      child: ElevatedButton(
        onPressed: () => controller.beginEvaluation(),
        child: const Text(
          'Begin Evaluation +',
          style: TypographyStyles.subtitle,
        ),
        style: ElevatedButton.styleFrom(
          primary: Palette.primaryColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }

  Widget _evaluationsList() {
    const marginBeginEvaluation = 50;
    const sizeBeginEvaluation = 65;

    return SizedBox(
      width: double.infinity,
      height: Get.height -
          marginBeginEvaluation -
          sizeBeginEvaluation -
          MediaQuery.of(Get.context!).padding.top -
          appbar.preferredSize.height,
      child: ListView.builder(
        itemCount: 20,
        scrollDirection: Axis.vertical,
        itemBuilder: (_, int index) => _evaluation(),
      ),
    );
  }

  Widget _evaluation() {
    DateTime date = DateTime.now();
    String surgeryType = 'Paranasal Sinus Endoscopy';
    String location = 'Radis Gallery - Santa Cruz, CA';

    return GestureDetector(
      onTap: () {
        controller.previousEvaluationDetail();
      },
      child: Container(
          height: 90,
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0, 0),
                    blurRadius: 4,
                    spreadRadius: 2)
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                date.toString(),
                style:
                    const TextStyle(color: Palette.primaryColor, fontSize: 14),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                surgeryType,
                style: const TextStyle(color: Colors.black, fontSize: 18),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.location_on_outlined,
                    color: Colors.black54,
                    size: 16,
                  ),
                  Text(
                    location,
                    style: const TextStyle(color: Colors.black54, fontSize: 14),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
