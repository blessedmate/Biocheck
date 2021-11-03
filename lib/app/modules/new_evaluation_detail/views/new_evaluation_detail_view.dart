import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/new_evaluation_detail_controller.dart';

class NewEvaluationDetailView extends GetView<NewEvaluationDetailController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NewEvaluationDetailView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'NewEvaluationDetailView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
