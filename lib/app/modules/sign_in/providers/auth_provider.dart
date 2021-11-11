import 'package:biocheck_flutter/config.dart';
import 'package:get/get.dart';

class AuthProvider extends GetConnect {
  final url = ConfigEnvironments.getUrl();

  login(String username, String password) async {
    final uri = Uri.https(url, 'Beta/users/login');
    final body = {'username': username, 'password': password};
    return await post(uri.toString(), body);
  }
}
