import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stunting/commons/globals.dart';
import 'package:flutter_stunting/page/authentication/register_page_1.dart';
import 'package:flutter_stunting/page/main/home_page.dart';
import 'package:flutter_stunting/widgets/button/primary_button.dart';
import 'package:flutter_stunting/widgets/button/social_button.dart';
import 'package:flutter_stunting/widgets/input/custom_bordered_input.dart';
import 'package:iconify_flutter/icons/ph.dart';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:twitter_login/twitter_login.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future googleSignIn() async {
    try {
      isSignedIn();
      final GoogleSignInAccount? user = await GoogleSignIn().signIn();

      if (user != null) {
        final GoogleSignInAuthentication auth = await user.authentication;

        final credential = GoogleAuthProvider.credential(
          accessToken: auth.accessToken,
          idToken: auth.idToken,
        );

        await FirebaseAuth.instance.signInWithCredential(credential);
        goToHome();
      }
    } catch (e) {
      print("Error :: $e");
    }
  }

  Future loginV2() async {
    final twitterLogin = TwitterLogin(
        apiKey: '',
        apiSecretKey: '',
        // redirectURI: 'https://stunting-82aaf.firebaseapp.com/__/auth/handler');
        redirectURI: 'stuntingauth://');

    /// Forces the user to enter their credentials
    /// to ensure the correct users account is authorized.
    /// If you want to implement Twitter account switching, set [force_login] to true
    /// login(forceLogin: true);
    final authResult = await twitterLogin.loginV2();
    switch (authResult.status) {
      case TwitterLoginStatus.loggedIn:
        // success
        print('====== Login success ======');
        break;
      case TwitterLoginStatus.cancelledByUser:
        // cancel
        print('====== Login cancel ======');
        break;
      case TwitterLoginStatus.error:
      case null:
        // error
        print('====== Login error ======');
        break;
    }
  }

  Future twitterSignIn() async {
    // Create a TwitterLogin instance
    final twitterLogin = new TwitterLogin(
        apiKey: '',
        apiSecretKey: '',
        // redirectURI: 'https://stunting-82aaf.firebaseapp.com/__/auth/handler');
        redirectURI: 'stuntingauth://');

    // Trigger the sign-in flow
    final authResult = await twitterLogin.login();

    // Create a credential from the access token
    final twitterAuthCredential = TwitterAuthProvider.credential(
      accessToken: authResult.authToken!,
      secret: authResult.authTokenSecret!,
    );

    // Once signed in, return the UserCredential
    // return await FirebaseAuth.instance.signInWithCredential(twitterAuthCredential);
    await FirebaseAuth.instance.signInWithCredential(twitterAuthCredential);
    goToHome();
  }

  Future facebookSignIn() async {
    try {
      final loginResult = await FacebookAuth.instance.login();
      final OAuthCredential facebookAuth =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);
      await FirebaseAuth.instance.signInWithCredential(facebookAuth);
      goToHome();
    } catch (e) {
      print("Error :: $e");
    }
  }

  void isSignedIn() async {
    final isSigned = await FirebaseAuth.instance.currentUser;
    if (isSigned != null) {
      goToHome();
    }
  }

  void goToHome() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const HomePage(),
      ),
    );
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
                      controller: usernameController,
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
                    )
                  ],
                ),
                const SizedBox(height: spacing * 6),
                PrimaryButton(
                  onPressed: () {},
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
                        onPressed: () async {
                          await loginV2();
                        },
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
