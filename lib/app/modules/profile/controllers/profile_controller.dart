import 'dart:convert';

import 'package:biocheck_flutter/app/data/models/models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProfileController extends GetxController with StateMixin<User> {
  User? currentUser;

  @override
  void onInit() {
    super.onInit();
    requestProfile();
  }

  /// Requests logged user's info
  void requestProfile() async {
    // User starts loading
    change(null, status: RxStatus.loading());

    final box = GetStorage();
    final userId = box.read('userId');
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    final response = await users.doc(userId).get();
    currentUser = User.fromJson(jsonEncode(response.data()));

    // User is loaded
    change(currentUser, status: RxStatus.success());
  }
}
