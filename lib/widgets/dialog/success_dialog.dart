import 'package:flutter/material.dart';
import 'package:flutter_stunting/commons/globals.dart';
import 'package:flutter_stunting/widgets/button/primary_button.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';

class SuccessDialog extends StatelessWidget {
  final Function onPressed;
  final title, subTitle;
  const SuccessDialog(
      {super.key, required this.onPressed, this.title, this.subTitle});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        title ?? 'Berhasil Mendaftar',
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.bold,
            ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            subTitle ?? "Silahkan kembali ke halaman login",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: spacing * 2),
          PrimaryButton(
              isLoading: false,
              onPressed: onPressed,
              title: "OK",
              type: ButtonType.primary),
        ],
      ),
    );
  }
}
