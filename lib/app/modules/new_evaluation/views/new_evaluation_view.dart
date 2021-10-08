import 'package:biocheck_flutter/app/routes/app_pages.dart';
import 'package:biocheck_flutter/app/utils/palette.dart';
import 'package:biocheck_flutter/app/utils/typography_styles.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/new_evaluation_controller.dart';

class NewEvaluationView extends GetView<NewEvaluationController> {
  final AppBar appbar = AppBar(
    title: const Text(
      'Evaluation',
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
      body: Center(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 10),
            group('Diagnosis', controller.options, controller.val),
            group('Prueba', controller.optionsb, controller.vale),
            saveAndPredict(),
          ],
        ),
      ),
    );
  }

  Widget group(String title, List<String> options, dynamic onChangeValue) {
    return Column(children: [
      Text(title, style: TypographyStyles.subtitle),
      SizedBox(
        height: (options.length.isOdd)
            ? 70 * (options.length + 1) / 2
            : 70 * options.length / 2,
        child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: options.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: (3 / 1),
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
            ),
            itemBuilder: (context, index) => Obx(() => SizedBox(
                  width: Get.width * 0.4,
                  height: 40,
                  // color: Colors.red,
                  child: Row(
                    children: [
                      Radio(
                        value: options[index],
                        groupValue: onChangeValue.value,
                        onChanged: (value) {
                          onChangeValue.value = value as String;
                        },
                      ),
                      Text(options[index])
                    ],
                  ),
                ))),
      ),
      Obx(() => controller.showWarning(onChangeValue)
          ? Column(
              children: const [
                Text(
                  'You must select an option',
                  style: TypographyStyles.warning,
                ),
                SizedBox(height: 10)
              ],
            )
          : Container())
    ]);
  }

  Widget saveAndPredict() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
      width: double.infinity,
      height: 65,
      child: ElevatedButton(
        onPressed: () => controller.submit(),
        child: const Text(
          'Save & Predict',
          style: TypographyStyles.bigbuttons,
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
