import 'package:flutter/material.dart';
import 'package:flutter_stunting/commons/globals.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_stunting/widgets/button/primary_button.dart';

class SuccessDialog extends StatelessWidget {
  final Function onPressed;
  const SuccessDialog({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Berhasil Mendaftar', textAlign: TextAlign.center),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          PrimaryButton(
              onPressed: onPressed, title: "OK", type: ButtonType.primary)
        ],
      ),
    );
  }
}
