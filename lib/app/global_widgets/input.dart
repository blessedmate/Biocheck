import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomInput extends StatelessWidget {
  final Widget icon;
  final String labelText;
  const CustomInput({Key? key, required this.icon, required this.labelText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          border: Border.all(), borderRadius: BorderRadius.circular(12)),
      child: Center(
        child: TextField(
          decoration: InputDecoration(
              labelText: labelText,
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              icon: icon),
        ),
      ),
    );
  }
}
