import 'package:biocheck_flutter/app/utils/palette.dart';
import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final Widget? icon;
  final String labelText;
  // final ValueSetter<String> onChanged;
  final Function(String)? onChanged;
  final Function()? onTap;
  final TextEditingController? textController;
  final Widget? suffixIcon;
  final bool readOnly;
  const CustomInput({
    Key? key,
    this.icon,
    required this.labelText,
    this.onChanged,
    this.onTap,
    this.textController,
    this.suffixIcon,
    this.readOnly = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black26),
          borderRadius: BorderRadius.circular(12)),
      child: Center(
        child: Theme(
            data: Theme.of(context).copyWith(
              primaryColor: Colors.red,
              colorScheme: Theme.of(context)
                  .colorScheme
                  .copyWith(secondary: Palette.primaryColor),
            ),
            child: TextField(
              cursorColor: Palette.primaryColor,
              onChanged: onChanged,
              onTap: onTap,
              readOnly: readOnly,
              controller: textController,
              decoration: InputDecoration(
                  suffixIcon: suffixIcon ?? const SizedBox(),
                  labelText: labelText,
                  labelStyle: const TextStyle(color: Palette.primaryColor),
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  icon: icon ?? const SizedBox()),
            )),
      ),
    );
  }
}
