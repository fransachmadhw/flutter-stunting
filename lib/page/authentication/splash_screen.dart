import 'package:flutter/material.dart';
import 'package:flutter_stunting/commons/globals.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SizedBox(
            width: spacing * 18,
            height: spacing * 18,
            child: Image.asset('assets/images/penstan_icon_dark.png'),
          ),
        ),
      ),
    );
  }
}
