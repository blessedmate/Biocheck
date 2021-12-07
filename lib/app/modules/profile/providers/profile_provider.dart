import 'dart:convert';

import 'package:biocheck_flutter/app/data/models/models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class ProfileProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  /// Requests an user's info to Firebase by specified ID
  Future<User> getProfileById(String userId) async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    final response = await users.doc(userId).get();
    return User.fromJson(jsonEncode(response.data()));
  }
}
