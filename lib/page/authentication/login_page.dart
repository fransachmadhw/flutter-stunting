import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stunting/commons/globals.dart';
import 'package:flutter_stunting/page/authentication/register_page_1.dart';
import 'package:flutter_stunting/widgets/button/primary_button.dart';
import 'package:flutter_stunting/widgets/button/social_button.dart';
import 'package:flutter_stunting/widgets/input/custom_bordered_input.dart';
import 'package:iconify_flutter/icons/ph.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
                SizedBox(
                  height: spacing * 2,
                ),
                Text('Atau dengan',
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: neutral200)),
                SizedBox(
                  height: spacing * 2,
                ),
                Row(
                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialButton(
                        onPressed: () {},
                        image: 'assets/images/facebook.png',
                        size: 24),
                    SizedBox(width: spacing * 2),
                    SocialButton(
                        onPressed: () {},
                        image: 'assets/images/google.png',
                        size: 24),
                    SizedBox(width: spacing * 2),
                    SocialButton(
                        onPressed: () {},
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
