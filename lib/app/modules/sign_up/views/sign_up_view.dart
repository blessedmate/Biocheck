import 'package:biocheck_flutter/app/global_widgets/input.dart';
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
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
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
                onChanged: (param) {},
              ),
              const SizedBox(
                height: 25,
              ),
              CustomInput(
                icon: const FaIcon(FontAwesomeIcons.envelope),
                labelText: 'Email',
                onChanged: (param) {},
              ),
              const SizedBox(
                height: 25,
              ),
              CustomInput(
                icon: const FaIcon(FontAwesomeIcons.lock),
                labelText: 'Password',
                onChanged: (param) {},
              ),
              const SizedBox(
                height: 25,
              ),
              CustomInput(
                icon: const FaIcon(FontAwesomeIcons.lock),
                labelText: 'Password',
                onChanged: (param) {},
              ),
              const SizedBox(
                height: 30,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () => controller.submit(),
                  child: const Text(
                    'Sign Up',
                    style: TypographyStyles.bigbuttons,
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: Palette.primaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      fixedSize: const Size(250, 60)),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                const Text(
                  'Already have an account?',
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
