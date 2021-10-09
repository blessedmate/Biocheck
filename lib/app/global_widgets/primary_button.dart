import 'package:biocheck_flutter/app/utils/palette.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final bool loading;
  const CustomButton(
      {Key? key,
      required this.onPressed,
      required this.text,
      this.loading = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Palette.primaryColor,
        onPrimary: Colors.white,
        shadowColor: Colors.greenAccent,
        elevation: 3,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
        minimumSize: Size(Get.width * 0.8, 55),
      ),
      onPressed: loading ? () {} : onPressed,
      child: loading
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            )
          : Text(text, style: const TextStyle(fontSize: 18)),
    );
  }
}
