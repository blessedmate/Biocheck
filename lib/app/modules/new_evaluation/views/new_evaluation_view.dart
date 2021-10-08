import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/new_evaluation_controller.dart';

class NewEvaluationView extends GetView<NewEvaluationController> {
  final AppBar appbar = AppBar(
    title: const Text(
      'Evaluation',
      style: TextStyle(fontSize: 25),
    ),
    foregroundColor: Colors.black,
    backgroundColor: Colors.white,
    elevation: 0,
  );

  final val = ''.obs;
  final vale = ''.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar,
      body: Center(
        child: Column(
          children: <Widget>[
            group('Diagnosis', controller.options, val),
            group('Prueba', controller.optionsb, vale),
          ],
        ),
        // Text(
        //   'NewEvaluationView is working',
        //   style: TextStyle(fontSize: 20),
        // ),
      ),
    );
  }

  Widget group(String title, List<String> options, dynamic onChangeValue) {
    return Column(children: [
      Text(title),
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
      if (onChangeValue.value == '') Text('Debes seleccionar al menos una')
    ]);
  }
}
