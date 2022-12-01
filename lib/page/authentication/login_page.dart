import 'dart:convert';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_stunting/commons/globals.dart';
import 'package:flutter_stunting/data/model/user_model.dart';
import 'package:flutter_stunting/page/authentication/register_page_1.dart';
import 'package:flutter_stunting/page/authentication/register_page_2.dart';
import 'package:flutter_stunting/page/main/home_page.dart';
import 'package:flutter_stunting/widgets/button/primary_button.dart';
import 'package:flutter_stunting/widgets/button/social_button.dart';
import 'package:flutter_stunting/widgets/input/custom_bordered_input.dart';
import 'package:iconify_flutter/icons/ph.dart';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:twitter_login/twitter_login.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final db = FirebaseFirestore.instance;
  String errMsg = '';
  bool isLoading = false;

  Future googleSignIn() async {
    toggleLoading();
    isSignedIn();
    final GoogleSignInAccount? user = await GoogleSignIn().signIn();

    if (user != null) {
      final GoogleSignInAuthentication auth = await user.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: auth.accessToken,
        idToken: auth.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);
      verifyData(FirebaseAuth.instance.currentUser!.email.toString());
    }
    toggleLoading();
  }

  Future twitterSignIn() async {
    toggleLoading();
    final twitterLogin = TwitterLogin(
      apiKey: 'kCywTm6nwsiFYYB3ONufkVaMw',
      apiSecretKey: 'tUKnkYT42KdtLNqLTWu37I9LXGgfVBl8dHgxW8ZNMpndwh96Iz',
      redirectURI: 'flutterstunting://',
    );

    final authResult = await twitterLogin.loginV2();
    switch (authResult.status) {
      case TwitterLoginStatus.loggedIn:
        final twitterAuthCredential = TwitterAuthProvider.credential(
          accessToken: authResult.authToken!,
          secret: authResult.authTokenSecret!,
        );
        await FirebaseAuth.instance.signInWithCredential(twitterAuthCredential);
        toggleLoading();
        verifyData(FirebaseAuth.instance.currentUser!.email.toString());
        break;
      case TwitterLoginStatus.cancelledByUser:
        setState(() {
          errMsg = 'Twitter login cancelled';
        });
        toggleLoading();
        break;
      case TwitterLoginStatus.error:
      case null:
        setState(() {
          errMsg = 'Error on twitter login';
        });
        toggleLoading();
        break;
    }
  }

  Future facebookSignIn() async {
    toggleLoading();
    final loginResult = await FacebookAuth.instance.login();
    final OAuthCredential facebookAuth =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);
    await FirebaseAuth.instance.signInWithCredential(facebookAuth);
    toggleLoading();
    verifyData(FirebaseAuth.instance.currentUser!.email.toString());
  }

  Future _emailLogin() async {
    try {
      toggleLoading();
      formValidate();

      if (errMsg != "") return;
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      verifyData(emailController.text);

      toggleLoading();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        setErr("User with email ${emailController.text} is not found");
      } else if (e.code == 'wrong-password') {
        setErr("Password is incorrect");
      } else {
        setErr("Server Error");
      }
      toggleLoading();
    }
  }

  void formValidate() {
    if (emailController.text == '') {
      setErr("Mohon inputkan email anda");
    } else if (!emailController.text.contains("@")) {
      setErr("Email tidak valid");
    } else if (passwordController.text == '') {
      setErr("Mohon inputkan password anda");
    } else {
      setErr("");
    }
  }

  void isSignedIn() async {
    final isSigned = await FirebaseAuth.instance.currentUser;
    if (isSigned != null) {
      verifyData(isSigned.email.toString());
    }
  }

  void setErr(String value) {
    setState(() {
      errMsg = value;
    });
  }

  void toggleLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  void goToHome() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const HomePage(),
      ),
    );
  }

  void goToRegister(String email) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => RegisterPage2(email: email),
      ),
    );
  }

  void verifyData(String email) async {
    DocumentSnapshot snapshot = await db.collection("users").doc(email).get();
    dynamic userData = snapshot.data();
    if (userData != null) {
      UserModel user = UserModel.fromJson(userData);
      saveUserData(user);
      goToHome();
    } else {
      goToRegister(email);
    }
  }

  void saveUserData(UserModel user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("user_data", json.encode(user));
  }

  @override
  void initState() {
    super.initState();
    isSignedIn();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(
                horizontal: spacing * 3, vertical: spacing * 3),
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: spacing * 18,
                  height: spacing * 18,
                  child: Image.asset('assets/images/penstan_icon_dark.png'),
                ),
                const SizedBox(height: spacing * 5),
                Text('Selamat Datang!',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineSmall),
                const SizedBox(height: spacing * 6),
                Wrap(
                  runSpacing: spacing * 2,
                  children: [
                    CustomBorderedInput(
                      controller: emailController,
                      hintText: "Masukan Username",
                      onChanged: (e) {},
                    ),
                    CustomBorderedInput(
                      controller: passwordController,
                      hintText: "Masukan Password",
                      onChanged: (e) {},
                      isPassword: true,
                      suffixIcon: Ph.eye_slash,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        'Lupa Password',
                        textAlign: TextAlign.right,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w500,
                              color: primary500,
                            ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: spacing * 2),
                Text(
                  errMsg,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w500,
                        color: red400,
                      ),
                ),
                const SizedBox(height: spacing * 3),
                PrimaryButton(
                  isLoading: isLoading,
                  onPressed: () => _emailLogin(),
                  title: 'Masuk',
                  type: ButtonType.primary,
                ),
                const SizedBox(height: spacing * 2),
                Text('Atau dengan',
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: neutral200)),
                const SizedBox(height: spacing * 2),
                Row(
                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialButton(
                        onPressed: () => facebookSignIn(),
                        image: 'assets/images/facebook.png',
                        size: 24),
                    const SizedBox(width: spacing * 2),
                    SocialButton(
                        onPressed: () => googleSignIn(),
                        image: 'assets/images/google.png',
                        size: 24),
                    const SizedBox(width: spacing * 2),
                    SocialButton(
                        onPressed: () => twitterSignIn(),
                        image: 'assets/images/twitter.png',
                        size: 24),
                  ],
                ),
                const SizedBox(height: spacing * 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Belum Punya Akun? ',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: neutral600,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    InkWell(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RegisterPage1()),
                      ),
                      child: Text(
                        'Daftar Sekarang ',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: primary500,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                  ],
                ),
                const SizedBox()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
