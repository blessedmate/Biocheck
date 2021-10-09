import 'package:biocheck_flutter/app/global_widgets/input.dart';
import 'package:biocheck_flutter/app/global_widgets/primary_button.dart';
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
                    child: Image.asset(
                      'assets/logo.png',
                      width: Get.width * 0.3,
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

                  // Row(
                  //   children: [
                  //     Row(
                  //       children: [
                  //         SizedBox(
                  //           height: 30,
                  //           width: 35,
                  //           child: Transform.scale(
                  //             transformHitTests: false,
                  //             scale: .6,
                  //             child: CupertinoSwitch(
                  //               value: false,
                  //               onChanged: (value) {},
                  //               activeColor: Colors.green,
                  //             ),
                  //           ),
                  //         ),
                  //         const SizedBox(
                  //           width: 10,
                  //         ),
                  //         const Text('Remember me')
                  //       ],
                  //     )
                  //   ],
                  // ),
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
                  const Expanded(child: SizedBox()),
                  Center(
                    child: GestureDetector(
                      onTap: () {},
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
