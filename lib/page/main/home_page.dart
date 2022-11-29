import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_stunting/commons/globals.dart';
import 'package:flutter_stunting/data/model/user_model.dart';
import 'package:flutter_stunting/page/authentication/login_page.dart';
import 'package:flutter_stunting/widgets/button/primary_button.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  // final UserModel? user;
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var userName = '';

  Future logout() async {
    await FirebaseAuth.instance.signOut();
    if (GoogleSignIn().currentUser != null) {
      await GoogleSignIn().disconnect();
    }
    if (await FacebookAuth.instance.accessToken != null) {
      await FacebookAuth.instance.logOut();
    }

    goToLogin();
  }

  void goToLogin() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginPage(),
      ),
    );
  }

  Future<dynamic> getUserData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    UserModel user =
        UserModel.fromJson(json.decode(prefs.getString("user_data")!));
    print(user.fullName);
  }

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(spacing * 3),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Selamat Datang!',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: spacing * 4),
              PrimaryButton(
                  isLoading: false,
                  onPressed: () => logout(),
                  title: 'Sign Out',
                  type: ButtonType.primary)
            ],
          ),
        ),
      ),
    );
  }
}
