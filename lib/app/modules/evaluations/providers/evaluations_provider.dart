import 'package:biocheck_flutter/config.dart';
import 'package:get/get.dart';

class EvaluationsProvider extends GetConnect {
  final url = ConfigEnvironments.getUrl();

  // Gets evaluations from user with id=userId
  getEvaluations(int userId, String token) async {
    final uri = Uri.https(url, 'Beta/forms/user/$userId');
    final headers = {
      "access-token": token,
    };
    final response = await get(uri.toString(), headers: headers);
    return response;
  }
}
