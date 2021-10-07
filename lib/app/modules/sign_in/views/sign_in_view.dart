import 'package:biocheck_flutter/app/global_widgets/input.dart';
import 'package:biocheck_flutter/app/routes/app_pages.dart';
import 'package:biocheck_flutter/app/utils/typography_styles.dart';
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/logo.png',
                  width: Get.width * 0.5,
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
              const CustomInput(
                icon: FaIcon(FontAwesomeIcons.envelope),
                labelText: 'Correo eletrónico',
              ),
              const SizedBox(
                height: 25,
              ),
              const CustomInput(
                icon: FaIcon(FontAwesomeIcons.lock),
                labelText: 'Contraseña',
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        height: 30, //set desired REAL HEIGHT
                        width: 35, //set desired REAL WIDTH
                        child: Transform.scale(
                          transformHitTests: false,
                          scale: .6,
                          child: CupertinoSwitch(
                            value: false,
                            onChanged: (value) {},
                            activeColor: Colors.green,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text('Remember me')
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
