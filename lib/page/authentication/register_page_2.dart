import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stunting/data/model/user_model.dart';
import 'package:flutter_stunting/page/authentication/login_page.dart';
import 'package:flutter_stunting/widgets/button/custom_back_button.dart';
import 'package:flutter_stunting/commons/globals.dart';
import 'package:flutter_stunting/widgets/button/primary_button.dart';
import 'package:flutter_stunting/widgets/dialog/success_dialog.dart';
import 'package:flutter_stunting/widgets/input/custom_bordered_input.dart';
import 'package:iconify_flutter/icons/ph.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterPage2 extends StatefulWidget {
  const RegisterPage2({super.key, required this.email});
  final String email;

  @override
  State<StatefulWidget> createState() => _RegisterPage2State();
}

class _RegisterPage2State extends State<RegisterPage2> {
  final db = FirebaseFirestore.instance;
  var userForm = {};
  String errMsg = "";
  bool isLoading = false;

  void register() async {
    toggleLoading();
    if (_formValidation()) {
      final data = UserModel(
        fullName: userForm["fullName"],
        email: userForm["email"],
        nik: userForm["nik"],
        dateOfBirth: userForm["dateOfBirth"],
        address: userForm["address"],
      );

      final docUser = db.collection("users").doc(userForm["email"]);
      await docUser.set(data.toJson());

      saveUserData(data);

      showDialog(
        context: context,
        builder: (BuildContext context) => SuccessDialog(
          onPressed: () => goToLogin(),
        ),
      );
    }
    toggleLoading();
  }

  void setForm(property, value) {
    setState(() {
      userForm[property] = value;
    });
  }

  bool _formValidation() {
    final form = [
      userForm["email"],
      userForm["fullName"],
      userForm["nik"],
      userForm["dateOfBirth"],
      userForm["address"]
    ];

    if (form.contains(null) || form.contains("")) {
      setErr("Data tidak lengkap");
      return false;
    } else {
      setErr("");
      return true;
    }
  }

  void saveUserData(UserModel user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("user_data", json.encode(user));
  }

  void goToLogin() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginPage(),
      ),
    );
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
  void initState() {
    super.initState();
    setForm("email", widget.email);
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
                    Text('Data Personal',
                        textAlign: TextAlign.left,
                        style: Theme.of(context).textTheme.headlineSmall),
                    // SizedBox(height: spacing),
                    SizedBox(
                      width: 254,
                      height: spacing * 5,
                      child: Text(
                          'Silahkan isi data berikut untuk melengkapi profil akun anda',
                          textAlign: TextAlign.left,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(color: neutral200)),
                    ),
                    const SizedBox(
                      height: spacing * 1,
                    ),
                    Wrap(
                      runSpacing: spacing * 2,
                      children: [
                        CustomBorderedInput(
                          hintText: "Nama Lengkap",
                          onChanged: (e) => setForm("fullName", e),
                          prefixIcon: Ph.user,
                        ),
                        CustomBorderedInput(
                          hintText: "Nomor Induk Kependudukan",
                          onChanged: (e) => setForm("nik", e),
                          prefixIcon: Ph.identification_card,
                        ),
                        CustomBorderedInput(
                          hintText: "Tanggal Lahir",
                          onChanged: (e) => setForm("dateOfBirth", e),
                          prefixIcon: Ph.identification_card,
                        ),
                        CustomBorderedInput(
                          hintText: "Alamat Domisili",
                          onChanged: (e) => setForm("address", e),
                          prefixIcon: Ph.house,
                        ),
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
                  // onPressed: () {
                  //   showDialog(
                  //     context: context,
                  //     builder: (BuildContext context) => SuccessDialog(
                  //         onPressed: () => {Navigator.of(context).pop()}),
                  //   );
                  // },
                  title: 'Daftar',
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
