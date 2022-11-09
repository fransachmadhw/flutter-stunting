import 'package:flutter/material.dart';
import 'package:flutter_stunting/commons/globals.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ph.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () => Navigator.pop(context),
      icon: const Iconify(Ph.arrow_left_light, color: neutral200),
      label: const Text(""),
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(0),
        backgroundColor: MaterialStateProperty.all(white),
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(vertical: spacing * 2),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius * 10),
            side: const BorderSide(
              color: neutral50,
              width: 2,
            ),
          ),
        ),
      ),
    );
  }
}
