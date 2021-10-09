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
      style: TypographyStyles.title,
    ),
    foregroundColor: Colors.black,
    backgroundColor: Colors.white,
    elevation: 0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _searchBar(),
            _evaluationsList(),
          ],
        ),
      ),
    );
  }

  Widget _searchBar() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      height: 60,
      child: CustomInput(
        icon: Icon(Icons.search),
        labelText: 'Search format',
        onChanged: (param) {},
      ),
      // TextField(
      //   textCapitalization: TextCapitalization.sentences,
      //   decoration: InputDecoration(
      //     border: OutlineInputBorder(
      //       borderRadius: BorderRadius.circular(10),
      //     ),
      //     labelText: 'Search format',
      //     prefixIcon: const Icon(Icons.search),
      //   ),
      // ),
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
      onTap: () => Get.toNamed(Routes.NEW_EVALUATION),
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
                    medicineField.toString(),
                    style: const TextStyle(
                        color: Palette.primaryColor, fontSize: 14),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    surgeryType,
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
