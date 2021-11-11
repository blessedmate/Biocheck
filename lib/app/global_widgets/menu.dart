import 'package:biocheck_flutter/app/routes/app_pages.dart';
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
              child: Container(),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/logo.png'),
                  fit: BoxFit.contain,
                ),
                // gradient: LinearGradient(
                //   begin: Alignment.topCenter,
                //   end: Alignment.bottomCenter,
                //   colors: [
                //     Palette.primaryColor.withOpacity(0.1),
                //     Colors.white,
                //   ],
                // ),
              ),
            ),
            ListTile(
              title: const Text('Home'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Profile'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Settings'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Contacts'),
              onTap: () {},
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
