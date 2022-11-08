import 'package:flutter/material.dart';
import 'package:flutter_stunting/commons/custom_text_theme.dart';
import 'package:flutter_stunting/commons/globals.dart';
import 'package:flutter_stunting/page/authentication/login_page.dart';
import 'package:flutter_stunting/page/authentication/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "globals.title",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
        textTheme: customTextTheme,
        colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: primary500,
              onPrimary: primary500,
              secondary: primary300,
            ),
      ),
      home: const SplashScreen(),
    );
  }
}
