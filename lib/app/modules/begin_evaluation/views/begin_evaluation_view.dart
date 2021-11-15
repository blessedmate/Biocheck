import 'package:biocheck_flutter/app/data/models/template.dart';
import 'package:biocheck_flutter/app/global_widgets/input.dart';
import 'package:biocheck_flutter/app/routes/app_pages.dart';
import 'package:biocheck_flutter/app/utils/palette.dart';
import 'package:biocheck_flutter/app/utils/typography_styles.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../controllers/begin_evaluation_controller.dart';

class BeginEvaluationView extends GetView<BeginEvaluationController> {
  BeginEvaluationView({Key? key}) : super(key: key);

  final AppBar appbar = AppBar(
    title: const Text(
      'New Evaluation',
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar,
      body: SingleChildScrollView(
          child: controller.obx(
        (evaluations) => Column(
          children: [
            _searchBar(),
            _evaluationsList(),
          ],
        ),
        onLoading: SizedBox(
          height: Get.height,
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        ),
        onError: (error) => const Center(child: Text('Upps')),
      )),
    );
  }

  Widget _searchBar() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      height: 60,
      child: CustomInput(
        icon: Icon(Icons.search),
        labelText: 'Search format',
        onChanged: (param) => controller.search(param),
      ),
    );
  }

  Widget _evaluationsList() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      width: double.infinity,
      // color: Colors.red,
      height: Get.height -
          MediaQuery.of(Get.context!).padding.top -
          appbar.preferredSize.height -
          100,
      child: Obx(
        () => ListView.builder(
          itemCount: controller.templates.length,
          itemBuilder: (_, int index) =>
              _newEvaluation(controller.templates[index]),
        ),
      ),
    );
  }

  Widget _newEvaluation(Template templateModel) {
    return GestureDetector(
      onTap: () => controller.tapOnEvaluationItem(templateModel),
      child: Container(
          height: 80,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
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
                    templateModel.specialty,
                    style: const TextStyle(
                        color: Palette.primaryColor, fontSize: 14),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    templateModel.title,
                    style: const TextStyle(color: Colors.black, fontSize: 18),
                  ),
                ],
              ),
              const Icon(
                Icons.add_circle_outline_sharp,
                color: Palette.primaryColor,
              )
            ],
          )),
    );
  }
}
