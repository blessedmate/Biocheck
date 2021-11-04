import 'package:biocheck_flutter/config.dart';
import 'package:get/get.dart';

class AuthProvider extends GetConnect {
  final url = ConfigEnvironments.getUrl();

  login(String email, String password) async {
    final uri = Uri.https(url, 'users/login');
    final body = {'email': email, 'password': password};
    return await post(uri.toString(), body);
  }
}
