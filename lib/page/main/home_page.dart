import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_stunting/commons/globals.dart';
import 'package:flutter_stunting/data/model/user_model.dart';
import 'package:flutter_stunting/page/authentication/login_page.dart';
import 'package:flutter_stunting/widgets/button/primary_button.dart';
import 'package:flutter_stunting/widgets/inkwell/news_inkwell.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:twitter_login/twitter_login.dart';

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

  void getUserName() async {
    final isSigned = await FirebaseAuth.instance.currentUser;
    if (isSigned != null) {
      setState(() {
        userName = isSigned!.displayName.toString();
      });
    } else {
      goToLogin();
    }
  }

  @override
  void initState() {
    super.initState();
    // getUserName();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(spacing * 3),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Text('Selamat Datang! ${userName != '' ? userName : ''}',
              //     textAlign: TextAlign.center,
              //     style: Theme.of(context).textTheme.headlineSmall),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Halo, Bayu!',
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(fontSize: 18)),
                  Text('24 November 2022',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodySmall),
                ],
              ),
              SizedBox(
                height: spacing,
              ),
              SizedBox(
                height: 150,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: NewsInkwell(),
                    );
                  },
                ),
              ),
              SizedBox(
                height: spacing,
              ),
              Text('Dashboard',
                  textAlign: TextAlign.left,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(fontSize: 18)),

              // Text('Selamat Datang! ${userName != '' ? userName : ''}',
              //     textAlign: TextAlign.center,
              //     style: Theme.of(context).textTheme.headlineSmall),
              // const SizedBox(height: spacing * 4),
              // PrimaryButton(
              //     onPressed: () => logout(),
              //     title: 'Sign Out',
              //     type: ButtonType.primary)
            ],
          ),
        ),
      ),
    );
  }
}
