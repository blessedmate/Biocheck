import 'package:biocheck_flutter/app/utils/typography_styles.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/risk_assessment_controller.dart';

class RiskAssessmentView extends GetView<RiskAssessmentController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Risk Assessment'),
        ),
        body: Container(
            padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
            // color: Colors.red,
            child: ListView.builder(
              itemCount: 7,
              itemBuilder: (context, index) => Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Access Difficulty',
                        style: TypographyStyles.subtitle,
                      ),
                      Text(
                        '12%',
                        style: TypographyStyles.subtitle,
                      )
                    ],
                  ),
                  const Divider(color: Colors.black54),
                  const SizedBox(height: 30),
                ],
              ),
            )));
  }
}
