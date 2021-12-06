import 'package:biocheck_flutter/app/global_widgets/global_widgets.dart';
import 'package:biocheck_flutter/app/utils/palette.dart';
import 'package:biocheck_flutter/app/utils/typography_styles.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            const _ProfilePicture(),
            const SizedBox(height: 50),
            const CustomInput(labelText: 'Name'),
            const SizedBox(height: 30),
            const CustomInput(
              labelText: 'Email',
              suffixIcon: Icon(
                Icons.lock_outline,
                color: Palette.primaryColor,
              ),
            ),
            const SizedBox(height: 30),
            const Text('Password'),
            const Text('*********'),
            TextButton(
              onPressed: () {},
              child: const Text(
                'Forgot your password?',
                style: TypographyStyles.signIn,
              ),
            ),
            const SizedBox(height: 20),
            const Text('Workplace'),
            const Text('Hospital Santa Fe'),
          ],
        ),
      ),
    );
  }
}

class _ProfilePicture extends StatelessWidget {
  const _ProfilePicture({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            height: 200,
            width: 200,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      'https://res.cloudinary.com/dkwnvvjcs/image/upload/v1638826864/biocheck/face_hqh6zy.jpg')),
            ),
          ),
          TextButton(
              onPressed: () {},
              child: const Text(
                'Change profile picture',
                style: TypographyStyles.signIn,
              ))
        ],
      ),
    );
  }
}
