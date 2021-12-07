import 'package:biocheck_flutter/app/routes/app_pages.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Menu extends StatelessWidget {
  Menu({
    Key? key,
  }) : super(key: key);
  final box = GetStorage();

  handleSignOut() {
    box.remove('token');
    box.remove('userId');
    Get.offAllNamed(Routes.SIGN_IN);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            DrawerHeader(
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: CachedNetworkImage(
                imageUrl:
                    'https://res.cloudinary.com/dkwnvvjcs/image/upload/v1636933892/biocheck/logo_zrtlow.png',
                fit: BoxFit.contain,
                fadeInDuration: const Duration(milliseconds: 0),
              ),
            ),
            ListTile(
              title: const Text('Home'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Profile'),
              onTap: () => Get.toNamed(Routes.PROFILE),
            ),
            ListTile(
              title: const Text('Settings'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Contacts'),
              onTap: () => Get.toNamed(Routes.CONTACTS),
            ),
            const Expanded(child: SizedBox()),
            const Divider(thickness: 2),
            ListTile(
              title: const Text('Log out'),
              onTap: () => handleSignOut(),
            ),
          ],
        ),
      ),
    );
  }
}
