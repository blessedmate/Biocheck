import 'package:biocheck_flutter/app/data/models/models.dart';
import 'package:biocheck_flutter/app/global_widgets/global_widgets.dart';
import 'package:biocheck_flutter/app/utils/palette.dart';
import 'package:biocheck_flutter/app/utils/typography_styles.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/evaluations_controller.dart';

class EvaluationsView extends GetView<EvaluationsController> {
  AppBar appbar = AppBar(
    title: const Text(
      'BioCheck',
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar,
      drawer: Menu(),
      body: Column(
        children: [
          BeginEvaluationButton(controller: controller, context: context),
          controller.obx(
            (evaluations) =>
                EvaluationsList(appbar: appbar, controller: controller),
            onLoading: const Center(
              child: CircularProgressIndicator(),
            ),
            onEmpty: const Center(
              child: Text('No previous evaluations'),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.update_outlined),
        backgroundColor: Palette.primaryColor,
        onPressed: () {
          controller.sendPendingEvaluations();
        },
      ),
    );
  }
}

class BeginEvaluationButton extends StatelessWidget {
  const BeginEvaluationButton({
    Key? key,
    required this.controller,
    required this.context,
  }) : super(key: key);

  final EvaluationsController controller;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
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
}

class EvaluationsList extends StatelessWidget {
  const EvaluationsList({
    Key? key,
    required this.appbar,
    required this.controller,
  }) : super(key: key);

  final AppBar appbar;
  final EvaluationsController controller;

  @override
  Widget build(BuildContext context) {
    final List<Evaluation> evaluationsList = controller.evaluationsList;
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
        physics: const BouncingScrollPhysics(),
        itemCount: evaluationsList.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (_, int index) => EvaluationCard(
          controller: controller,
          evaluation: evaluationsList[index],
        ),
      ),
    );
  }
}

class EvaluationCard extends StatelessWidget {
  const EvaluationCard({
    Key? key,
    required this.controller,
    required this.evaluation,
  }) : super(key: key);

  final EvaluationsController controller;
  final Evaluation evaluation;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.previousEvaluationDetail();
      },
      child: Container(
          height: 95,
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    evaluation.dueDate,
                    style: const TextStyle(
                        color: Palette.primaryColor, fontSize: 14),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    evaluation.template.name,
                    style: const TextStyle(color: Colors.black, fontSize: 18),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.person_outline,
                        color: Colors.black54,
                        size: 16,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        '${evaluation.patientFirstName} ${evaluation.patientLastName}',
                        style: const TextStyle(
                            color: Colors.black54, fontSize: 14),
                      ),
                    ],
                  ),
                ],
              ),
              evaluation.sent == false
                  ? const Icon(Icons.update_outlined,
                      color: Colors.yellow, size: 32)
                  : Container()
            ],
          )),
    );
  }
}
