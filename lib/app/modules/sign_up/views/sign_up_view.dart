import 'package:biocheck_flutter/app/global_widgets/input.dart';
import 'package:biocheck_flutter/app/global_widgets/primary_button.dart';
import 'package:biocheck_flutter/app/utils/palette.dart';
import 'package:biocheck_flutter/app/utils/typography_styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

import '../controllers/sign_up_controller.dart';

class SignUpView extends GetView<SignUpController> {
  const SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: Get.height,
          padding:
              EdgeInsets.fromLTRB(Get.width * 0.075, 30, Get.width * 0.075, 0),
          // color: Colors.red,
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const BackButton(),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Sign up',
                style: TypographyStyles.title,
              ),
              const SizedBox(
                height: 25,
              ),
              CustomInput(
                icon: const FaIcon(FontAwesomeIcons.solidUser),
                labelText: 'Name',
                onChanged: (val) => controller.name = val,
              ),
              const SizedBox(
                height: 25,
              ),
              CustomInput(
                icon: const FaIcon(FontAwesomeIcons.solidEnvelope),
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
                icon: const FaIcon(FontAwesomeIcons.atom),
                labelText: 'Specialty',
                onChanged: (val) => controller.specialty = val,
              ),
              const SizedBox(
                height: 25,
              ),
              Obx(
                () => Container(
                  width: Get.width * 0.9,
                  height: 60,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black26),
                      borderRadius: BorderRadius.circular(12)),
                  child: DropdownButton<String>(
                    focusColor: Colors.white,
                    value: controller.dropDownValue,
                    underline: Container(),
                    //elevation: 5,
                    style: TextStyle(color: Colors.white),
                    iconEnabledColor: Colors.black,
                    items: <String>[
                      'Select your hospital',
                      ...controller.hospitals
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: const TextStyle(color: Colors.black),
                        ),
                      );
                    }).toList(),
                    hint: const Text(
                      "Please choose a langauage",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    onChanged: (String? value) =>
                        controller.dropDownValue = value!,
                  ),
                ),
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
            ]),
          )),
    );
  }
}
