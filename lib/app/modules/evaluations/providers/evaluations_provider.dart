import 'package:biocheck_flutter/app/data/models/evaluation.dart';
import 'package:biocheck_flutter/config.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class EvaluationsProvider extends GetConnect {
  final url = ConfigEnvironments.getUrl();

  // Gets evaluations from user with id=userId
  Future<List<Evaluation>> getEvaluations(String userId) async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    final history = await users.doc(userId).collection('history').get();
    return history.docs.map((e) => Evaluation.fromMap(e.data())).toList();
  }
}
