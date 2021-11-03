import 'package:biocheck_flutter/app/utils/palette.dart';
import 'package:biocheck_flutter/app/utils/typography_styles.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/new_evaluation_controller.dart';

class NewEvaluationView extends GetView<NewEvaluationController> {
  const NewEvaluationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Evaluation',
          style: TypographyStyles.title,
        ),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 10),
            Options(
                controller: controller,
                title: 'Diagnosis',
                options: controller.options1,
                onChangeValue: controller.val1),
            Options(
                controller: controller,
                title: 'Previous surgery',
                options: controller.options2,
                onChangeValue: controller.val2),
            const SectionsList(),
            SaveAndPredictButton(controller: controller),
          ],
        ),
      ),
    );
  }
}

class Options extends StatelessWidget {
  const Options({
    Key? key,
    required this.controller,
    required this.title,
    required this.options,
    required this.onChangeValue,
  }) : super(key: key);

  final NewEvaluationController controller;
  final String title;
  final List<String> options;
  final onChangeValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // TODO: Align title left
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
                mainAxisSpacing: 1,
              ),
              itemBuilder: (context, index) => Obx(() => SizedBox(
                    width: Get.width * 0.4,
                    height: 40,
                    child: Row(
                      children: [
                        Radio(
                          activeColor: Palette.secondaryColor,
                          value: options[index],
                          groupValue: onChangeValue.value,
                          onChanged: (value) {
                            onChangeValue.value = value as String;
                          },
                        ),
                        Text(
                          options[index],
                          style: TypographyStyles.evaluationOptions,
                        )
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
      ],
    );
  }
}

class SectionsList extends StatelessWidget {
  const SectionsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: 4,
        scrollDirection: Axis.vertical,
        itemBuilder: (_, index) => const Section(title: 'Axial'),
      ),
    );
  }
}

class Section extends StatelessWidget {
  const Section({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
              color: Colors.white10,
              offset: Offset(0, 0),
              blurRadius: 4,
              spreadRadius: 1)
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TypographyStyles.subtitle,
          ),
          const Icon(Icons.check_circle_outline, color: Palette.secondaryColor),
        ],
      ),
    );
  }
}

class SaveAndPredictButton extends StatelessWidget {
  const SaveAndPredictButton({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final NewEvaluationController controller;

  @override
  Widget build(BuildContext context) {
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
