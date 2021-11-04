import 'package:biocheck_flutter/app/utils/palette.dart';
import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  const Menu({
    Key? key,
  }) : super(key: key);

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
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
