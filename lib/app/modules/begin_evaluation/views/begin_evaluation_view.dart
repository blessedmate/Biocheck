import 'package:biocheck_flutter/app/utils/palette.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/begin_evaluation_controller.dart';

class BeginEvaluationView extends GetView<BeginEvaluationController> {
  BeginEvaluationView({Key? key}) : super(key: key);

  final AppBar appbar = AppBar(
    title: const Text(
      'New Evaluation',
      style: TextStyle(fontSize: 25),
    ),
    foregroundColor: Colors.black,
    backgroundColor: Colors.white,
    elevation: 0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar,
      body: Column(
        children: [
          _evaluationsList(),
        ],
      ),
    );
  }

  Widget _evaluationsList() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      width: double.infinity,
      height: Get.height -
          MediaQuery.of(Get.context!).padding.top -
          appbar.preferredSize.height, // color: Colors.red,
      child: ListView.builder(
        itemCount: 20,
        itemBuilder: (_, int index) => _newEvaluation(),
      ),
    );
  }

  Widget _newEvaluation() {
    String medicineField = 'Otolaryngology';
    String surgeryType = 'Paranasal Sinus Endoscopy';

    return GestureDetector(
      onTap: () {},
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
                medicineField.toString(),
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
            ],
          )),
    );
  }
}
