import 'package:biocheck_flutter/app/data/models/models.dart';
import 'package:biocheck_flutter/app/modules/profile/providers/profile_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io' as i;

class ProfileController extends GetxController with StateMixin<User> {
  User? currentUser;
  final box = GetStorage();

  final provider = ProfileProvider();

  final urlPhoto =
      'https://res.cloudinary.com/dkwnvvjcs/image/upload/v1638826864/biocheck/face_hqh6zy.jpg'
          .obs;

  final loadingPhoto = false.obs;

  bool isOnline = false;

  @override
  void onInit() async {
    super.onInit();
    isOnline = await checkStatus();
    requestProfile();
  }

  Future<bool> checkStatus() async {
    bool isOnline = false;
    try {
      final result = await i.InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        isOnline = true;
      } else {
        isOnline = false;
      }
    } on i.SocketException catch (_) {
      isOnline = false;
    }
    return isOnline;
  }

  /// Requests logged user's info
  void requestProfile() async {
    // User starts loading
    change(null, status: RxStatus.loading());

    final box = GetStorage();
    final userId = box.read('userId');

    currentUser = await provider.getProfileById(userId);
    box.write('name', currentUser!.name);
    if (currentUser!.imageUrl! != '') {
      urlPhoto.value = currentUser!.imageUrl!;
    }

    // User is loaded
    change(currentUser, status: RxStatus.success());
  }

  updatePhoto(id) async {
    final ImagePicker _picker = ImagePicker();
    // Pick an image
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      loadingPhoto.value = true;
      await FirebaseStorage.instance
          .ref()
          .child("photos")
          .child(id)
          .putFile(i.File(image.path));
      String downloadURL =
          await FirebaseStorage.instance.ref('photos/$id').getDownloadURL();
      urlPhoto.value = downloadURL;
      loadingPhoto.value = false;

      CollectionReference users =
          FirebaseFirestore.instance.collection('users');
      final uid = box.read('userId');
      users.doc(uid).update({"imageUrl": downloadURL});
    }
  }
}
