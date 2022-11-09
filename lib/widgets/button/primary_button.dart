import 'package:flutter/material.dart';
import 'package:flutter_stunting/commons/globals.dart';

enum ButtonType { primary, secondary, tertiary }

class PrimaryButton extends StatelessWidget {
  final String title;
  final Enum type;
  final Function onPressed;

  const PrimaryButton(
      {super.key,
      required this.onPressed,
      required this.title,
      required this.type});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPressed,
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(0),
        backgroundColor: MaterialStateProperty.all(
          type == ButtonType.primary ? primary500 : white,
        ),
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(vertical: spacing * 3),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
            side: BorderSide(
              color: type == ButtonType.secondary ? primary500 : white,
              width: 2,
            ),
          ),
        ),
      ),
      child: Text(
        title,
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: type == ButtonType.primary ? white : primary500,
              fontWeight: FontWeight.w500,
            ),
      ),
    );
  }
}
