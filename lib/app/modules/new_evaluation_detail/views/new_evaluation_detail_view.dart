import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/new_evaluation_detail_controller.dart';

class NewEvaluationDetailView extends GetView<NewEvaluationDetailController> {
  const NewEvaluationDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Axial'),
      ),
      body: const Center(
        child: Text(
          'NewEvaluationDetailView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
