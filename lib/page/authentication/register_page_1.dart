import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stunting/page/authentication/register_page_2.dart';
import 'package:flutter_stunting/widgets/button/custom_back_button.dart';
import 'package:flutter_stunting/commons/globals.dart';
import 'package:flutter_stunting/widgets/button/primary_button.dart';
import 'package:flutter_stunting/widgets/input/custom_bordered_input.dart';
import 'package:iconify_flutter/icons/ph.dart';

class RegisterPage1 extends StatefulWidget {
  const RegisterPage1({super.key});

  @override
  State<StatefulWidget> createState() => _RegisterPage1State();
}

class _RegisterPage1State extends State<RegisterPage1> {
  TextEditingController namaController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: spacing * 3, vertical: spacing * 3),
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomBackButton(),
                  SizedBox(height: spacing * 2),
                  Text('Daftar Akun',
                      textAlign: TextAlign.left,
                      style: Theme.of(context).textTheme.headlineSmall),
                  // SizedBox(height: spacing),
                  SizedBox(
                    width: 246,
                    height: spacing * 5,
                    child: Text(
                        'Silahkan buat akun terlebih dahulu untuk bergabung sekarang',
                        textAlign: TextAlign.left,
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: neutral200)),
                  ),
                  SizedBox(
                    height: spacing * 1,
                  ),
                  Wrap(
                    runSpacing: spacing * 2,
                    children: [
                      CustomBorderedInput(
                        controller: namaController,
                        hintText: "Nama Pengguna",
                        onChanged: (e) {},
                        prefixIcon: Ph.user,
                      ),
                      CustomBorderedInput(
                        controller: emailController,
                        hintText: "Email",
                        onChanged: (e) {},
                        prefixIcon: Ph.envelope_simple,
                      ),
                      CustomBorderedInput(
                        controller: passwordController,
                        hintText: "Password",
                        onChanged: (e) {},
                        isPassword: true,
                        prefixIcon: Ph.lock,
                        suffixIcon: Ph.eye_slash,
                      ),
                    ],
                  ),
                ],
              ),
              PrimaryButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const RegisterPage2()),
                ),
                title: 'Selanjutnya',
                type: ButtonType.primary,
              ),
              // Align(
              //   child:
              //   alignment: Alignment.bottomCenter,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
