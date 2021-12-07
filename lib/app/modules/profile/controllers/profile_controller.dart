import 'package:biocheck_flutter/app/data/models/models.dart';
import 'package:biocheck_flutter/app/modules/profile/providers/profile_provider.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProfileController extends GetxController with StateMixin<User> {
  User? currentUser;

  final provider = ProfileProvider();

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

    currentUser = await provider.getProfileById(userId);

    // User is loaded
    change(currentUser, status: RxStatus.success());
  }
}
