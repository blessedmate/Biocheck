import 'package:biocheck_flutter/app/global_widgets/input.dart';
import 'package:biocheck_flutter/app/global_widgets/primary_button.dart';
import 'package:biocheck_flutter/app/utils/palette.dart';
import 'package:biocheck_flutter/app/utils/typography_styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

import '../controllers/sign_up_controller.dart';

class SignUpView extends GetView<SignUpController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        physics:
            const BouncingScrollPhysics(parent: NeverScrollableScrollPhysics()),
        child: Container(
            height: Get.height * 0.8,
            padding: EdgeInsets.fromLTRB(
                Get.width * 0.075, 30, Get.width * 0.075, 0),
            // color: Colors.red,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text(
                'Sign up',
                style: TypographyStyles.title,
              ),
              const SizedBox(
                height: 40,
              ),
              CustomInput(
                icon: const FaIcon(FontAwesomeIcons.user),
                labelText: 'Username',
                onChanged: (val) => controller.username = val,
              ),
              const SizedBox(
                height: 25,
              ),
              CustomInput(
                icon: const FaIcon(FontAwesomeIcons.envelope),
                labelText: 'Email',
                onChanged: (val) => controller.email = val,
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
                height: 25,
              ),
              CustomInput(
                icon: const FaIcon(FontAwesomeIcons.lock),
                labelText: 'Confirm password',
                onChanged: (val) => controller.confirmPassword = val,
              ),
              const SizedBox(
                height: 30,
              ),
              GetBuilder<SignUpController>(
                  id: 'warning',
                  builder: (_) => controller.error
                      ? Center(
                          child: Text(
                            controller.message,
                            textAlign: TextAlign.center,
                            style: TypographyStyles.warning,
                          ),
                        )
                      : Container()),
              const SizedBox(
                height: 10,
              ),
              Obx(() => Align(
                    alignment: Alignment.center,
                    child: CustomButton(
                      loading: controller.loading,
                      onPressed: () => controller.signUp(),
                      text: 'SIGN UP',
                    ),
                  )),
              const SizedBox(
                height: 30,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                const Text(
                  'Already have an account?',
                  style: TextStyle(fontSize: 18),
                ),
                TextButton(
                    onPressed: () => controller.goToSignIn(),
                    child: const Text(
                      'Sign In',
                      style: TypographyStyles.signIn,
                    ))
              ])
            ])),
      ),
    );
  }
}
