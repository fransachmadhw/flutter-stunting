import 'package:flutter/material.dart';
import 'package:flutter_stunting/commons/globals.dart';

class SocialButton extends StatelessWidget {
  final Function onPressed;
  final String image;
  final double size;

  const SocialButton(
      {super.key,
      required this.onPressed,
      required this.image,
      required this.size});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPressed(),
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(0),
        backgroundColor: MaterialStateProperty.all(
          white,
        ),
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(vertical: spacing * 3),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius * 10),
            side: BorderSide(
              color: neutral100,
              width: 1,
            ),
          ),
        ),
      ),
      child: Image.asset(image, height: size, width: size),
    );
  }
}
