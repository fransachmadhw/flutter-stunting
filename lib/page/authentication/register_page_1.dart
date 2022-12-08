import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  // Form Controller
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final db = FirebaseFirestore.instance;
  String errMsg = "";
  var userForm = {};
  bool isLoading = false;

  Future<dynamic> register() async {
    toggleLoading();
    _formValidation();
    if (errMsg == "") {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.toString(),
        password: passwordController.text.toString(),
      );
      nextRegister(emailController.text);
    }
    toggleLoading();
  }

  void nextRegister(String email) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RegisterPage2(email: email),
      ),
    );
  }

  void _formValidation() {
    if (emailController.text == "") {
      setErr("Mohon inputkan email");
    } else if (!emailController.text.contains("@")) {
      setErr("Email tidak valid");
    } else if (passwordController.text.length < 6) {
      setErr("Password terlalu pendek");
    } else if (passwordController.text == "") {
      setErr("Mohon inputkan password");
    } else {
      setErr("");
    }
  }

  void toggleLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  void setErr(value) {
    setState(() {
      errMsg = value;
    });
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomBackButton(),
                    const SizedBox(height: spacing * 2),
                    Text('Daftar Akun',
                        textAlign: TextAlign.left,
                        style: Theme.of(context).textTheme.headlineSmall),
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
                    const SizedBox(height: spacing * 2),
                    Wrap(
                      runSpacing: spacing * 2,
                      children: [
                        CustomBorderedInput(
                          controller: emailController,
                          hintText: "Email",
                          onChanged: (e) {},
                          prefixIcon: Ph.envelope_simple,
                        ),
                        Wrap(
                          runSpacing: spacing,
                          children: [
                            CustomBorderedInput(
                              controller: passwordController,
                              hintText: "Password",
                              onChanged: (e) {},
                              isPassword: true,
                              prefixIcon: Ph.lock,
                              suffixIcon: Ph.eye_slash,
                            ),
                            Text(
                              '* Minimal 6 karakter',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    color: neutral500,
                                  ),
                            )
                          ],
                        )
                      ],
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
                const SizedBox(height: spacing * 2),
                PrimaryButton(
                  isLoading: isLoading,
                  onPressed: () => register(),
                  title: 'Selanjutnya',
                  type: ButtonType.primary,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
