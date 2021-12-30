import 'package:biocheck_flutter/app/data/models/models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class ContactsProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  /// Requests an user's contacts list to Firebase by specified Hospital
  Future<List<User>> getContactsByHospital(String hospitalName) async {
    List<User> contacts = [];

    final query = FirebaseFirestore.instance
        .collection('users')
        .where('hospital.name', isEqualTo: hospitalName);
    final response = await query.get();

    for (var element in response.docs) {
      contacts.add(User.fromMap(element.data()));
    }

    return contacts;
  }
}
