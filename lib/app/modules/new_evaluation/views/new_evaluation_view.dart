import 'package:biocheck_flutter/app/global_widgets/global_widgets.dart';
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
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),

              // Date field
              CustomInput(
                icon: const Icon(Icons.date_range),
                readOnly: true,
                labelText: 'Evaluation due date',
                textController: controller.dateController,
                onTap: () => _selectDate(),
              ),
              GetBuilder<NewEvaluationController>(
                  builder: (_) =>
                      controller.showWarning(controller.dateController)
                          ? _warningText()
                          : Container()),
              const SizedBox(height: 20),

              const Text('Patient\'s Info', style: TypographyStyles.subtitle),
              const SizedBox(height: 20),

              // First name field
              CustomInput(
                icon: const SizedBox(),
                labelText: 'First name',
                textController: controller.firstNameController,
              ),
              GetBuilder<NewEvaluationController>(
                  builder: (_) =>
                      controller.showWarning(controller.firstNameController)
                          ? _warningText()
                          : Container()),
              const SizedBox(height: 20),

              // Last name field
              CustomInput(
                icon: const SizedBox(),
                labelText: 'Last name',
                textController: controller.lastNameController,
              ),
              GetBuilder<NewEvaluationController>(
                  builder: (_) =>
                      controller.showWarning(controller.lastNameController)
                          ? _warningText()
                          : Container()),

              const SizedBox(height: 30),
              SectionsList(controller: controller),
              SaveAndPredictButton(controller: controller),
            ],
          ),
        ),
      ),
    );
  }

  Column _warningText() {
    return Column(
      children: const [
        Text(
          'You must select an option',
          style: TypographyStyles.warning,
        ),
        SizedBox(height: 10)
      ],
    );
  }

  void _selectDate() async {
    DateTime? picked = await showDatePicker(
        context: Get.context!,
        initialDate: DateTime.now(),
        firstDate: DateTime(2018),
        lastDate: DateTime(2025));

    controller.setSelectedDate(picked);
  }
}

class SectionsList extends StatelessWidget {
  const SectionsList({Key? key, required this.controller}) : super(key: key);
  final NewEvaluationController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: 4,
        scrollDirection: Axis.vertical,
        itemBuilder: (_, index) =>
            Section(title: 'Axial', controller: controller),
      ),
    );
  }
}

class Section extends StatelessWidget {
  const Section({
    Key? key,
    required this.title,
    required this.controller,
  }) : super(key: key);

  final String title;
  final NewEvaluationController controller;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => controller.goToSectionDetail(),
      child: Container(
        height: 60,
        margin: const EdgeInsets.symmetric(vertical: 10),
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
            const Icon(Icons.check_circle_outline,
                color: Palette.secondaryColor),
          ],
        ),
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
      margin: const EdgeInsets.symmetric(vertical: 25),
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
