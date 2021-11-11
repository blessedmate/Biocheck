import 'package:biocheck_flutter/config.dart';
import 'package:get/get.dart';

class AuthProvider extends GetConnect {
  final url = ConfigEnvironments.getUrl();

  signUp(String name, String email, String username, String password,
      String institution) async {
    final uri = Uri.https(url, 'Beta/users');
    final body = {
      'email': email,
      'name': name,
      'username': username,
      'password': password,
      'institution': institution
    };
    return await post(uri.toString(), body);
  }
}
