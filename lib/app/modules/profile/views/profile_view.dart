import 'package:biocheck_flutter/app/global_widgets/global_widgets.dart';
import 'package:biocheck_flutter/app/utils/palette.dart';
import 'package:biocheck_flutter/app/utils/typography_styles.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io' as i;

import '../controllers/profile_controller.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ProfileView extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: controller.obx(
        (state) {
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                profile(
                  controller.currentUser!.email,
                ),
                const SizedBox(height: 30),
                CustomInput(
                  labelText: 'Name',
                  textController:
                      TextEditingController(text: controller.currentUser!.name),
                ),
                const SizedBox(height: 30),
                CustomInput(
                  labelText: 'Email',
                  suffixIcon: const Icon(
                    Icons.lock_outline,
                    color: Palette.primaryColor,
                  ),
                  textController: TextEditingController(
                      text: controller.currentUser!.email),
                ),
                const SizedBox(height: 30),
                const Text(
                  'Password',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                const Text('*********'),
                GestureDetector(
                  onTap: () {},
                  child: const Text(
                    'Forgot your password?',
                    style: TextStyle(fontSize: 14, color: Palette.primaryColor),
                  ),
                ),
                const SizedBox(height: 30),
                const Text(
                  'Workplace',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                Text(controller.currentUser!.hospital.name),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget profile(id) {
    return Center(
      child: Column(
        children: [
          Obx(() => Stack(
                children: [
                  Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: controller.isOnline
                              ? CachedNetworkImageProvider(
                                  controller.urlPhoto.value,
                                )
                              : Image.asset('assets/images/no-image.png')
                                  .image),
                    ),
                  ),
                  controller.loadingPhoto.value
                      ? Container(
                          height: 200,
                          width: 200,
                          child: const Center(
                            child: CircularProgressIndicator(
                              color: Palette.primaryColor,
                            ),
                          ),
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Colors.white38),
                        )
                      : const SizedBox(
                          height: 200,
                          width: 200,
                        )
                ],
              )),
          TextButton(
              onPressed: () => controller.updatePhoto(id),
              child: const Text(
                'Change profile picture',
                style: TypographyStyles.signIn,
              ))
        ],
      ),
    );
  }
}
