import 'package:biocheck_flutter/config.dart';
import 'package:get/get.dart';

class TemplatesProvider extends GetConnect {
  final url = ConfigEnvironments.getUrl();

  getEvaluations() async {
    final uri = Uri.https(url, 'evaluations');
    return await get(uri.toString());
  }
}
