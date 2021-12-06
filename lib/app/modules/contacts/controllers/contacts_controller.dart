import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactsController extends GetxController {
  //TODO: Implement ContactsController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;

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
}
