import 'package:biocheck_flutter/app/data/models/models.dart';
import 'package:biocheck_flutter/app/modules/contacts/providers/contacts_provider.dart';
import 'package:biocheck_flutter/app/modules/profile/providers/profile_provider.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactsController extends GetxController with StateMixin<List<User>> {
  List<User> contacts = [];

  final contactsProvider = ContactsProvider();

  @override
  void onInit() {
    super.onInit();
    requestContacts();
  }

  void sendMail(String mail) async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: mail,
      query: encodeQueryParameters(<String, String>{'subject': 'Mail test'}),
    );

    await launch(emailLaunchUri.toString());
  }

  String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }

  /// Requests logged user's contacts
  void requestContacts() async {
    // Contacts start loading
    change(contacts, status: RxStatus.loading());

    final box = GetStorage();
    final userId = box.read('userId');
    final profileProvider = ProfileProvider();

    // Get current user to search by hospital
    User currentUser = await profileProvider.getProfileById(userId);
    String hospitalName = currentUser.hospital.name;

    contacts = await contactsProvider.getContactsByHospital(hospitalName);

    // Contacts are loaded
    change(contacts, status: RxStatus.success());
  }
}
