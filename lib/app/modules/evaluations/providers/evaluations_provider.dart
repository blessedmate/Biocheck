import 'package:biocheck_flutter/config.dart';
import 'package:get/get.dart';

class EvaluationsProvider extends GetConnect {
  final url = ConfigEnvironments.getUrl();
  final userId = 37;

  getEvaluations() async {
    final uri = Uri.https(url, 'Beta/forms/user/$userId');
    final headers = {
      "access-token":
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjaGVjayI6dHJ1ZSwiaWF0IjoxNjM2NTA5MjIyfQ.Tx3hS2NBDvMbNUmY-H3-otM5QfZwWPAv08jIjO4T644',
    };
    final response = await get(uri.toString(), headers: headers);
    return response;
  }
}
