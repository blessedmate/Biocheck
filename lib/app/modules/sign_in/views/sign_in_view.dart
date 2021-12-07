import 'package:biocheck_flutter/app/global_widgets/input.dart';
import 'package:biocheck_flutter/app/global_widgets/primary_button.dart';
import 'package:biocheck_flutter/app/routes/app_pages.dart';
import 'package:biocheck_flutter/app/utils/palette.dart';
import 'package:biocheck_flutter/app/utils/typography_styles.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../controllers/sign_in_controller.dart';

class SignInView extends GetView<SignInController> {
  const SignInView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Get.width * 0.075),
          child: SingleChildScrollView(
            child: SizedBox(
              height: Get.height - MediaQuery.of(Get.context!).padding.top - 40,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: CachedNetworkImage(
                      imageUrl:
                          'https://res.cloudinary.com/dkwnvvjcs/image/upload/v1636933892/biocheck/logo_zrtlow.png',
                      width: Get.width * 0.3,
                      fadeInDuration: const Duration(milliseconds: 0),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const Text(
                    'Sign in',
                    style: TypographyStyles.title,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  CustomInput(
                    icon: const FaIcon(FontAwesomeIcons.envelope),
                    labelText: 'Username',
                    onChanged: (val) => controller.username = val,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  CustomInput(
                    icon: const FaIcon(FontAwesomeIcons.lock),
                    labelText: 'Password',
                    onChanged: (val) => controller.password = val,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GetBuilder<SignInController>(
                      id: 'warning',
                      builder: (_) => controller.error
                          ? Center(
                              child: Text(
                                controller.message,
                                textAlign: TextAlign.center,
                                style: const TextStyle(color: Colors.red),
                              ),
                            )
                          : Container()),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(height: 50),
                  Obx(() => Align(
                        alignment: Alignment.center,
                        child: CustomButton(
                          loading: controller.loading,
                          onPressed: () => controller.signIn(),
                          text: 'SIGN IN',
                        ),
                      )),
                  const SizedBox(height: 15),
                  // Center(
                  //     child: TextButton(
                  //   onPressed: () async {
                  //     final isAuthenticated = await controller.authenticate();
                  //     if (isAuthenticated) {
                  //       controller.fingerCheck();
                  //     }
                  //   },
                  //   child: const Icon(
                  //     Icons.fingerprint,
                  //     color: Palette.primaryColor,
                  //     size: 40,
                  //   ),
                  //   style: TextButton.styleFrom(
                  //     primary: Colors.white,
                  //     elevation: 0,
                  //   ),
                  // )),
                  const SizedBox(height: 15),
                  Center(
                    child: GestureDetector(
                      onTap: () => controller.goToSignUp(),
                      child: RichText(
                        text: const TextSpan(
                            text: 'Don\'t have an account?',
                            style: TextStyle(color: Colors.black, fontSize: 18),
                            children: <TextSpan>[
                              TextSpan(
                                  text: ' Sign up',
                                  style: TextStyle(
                                      color: Colors.blueAccent, fontSize: 18))
                            ]),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
