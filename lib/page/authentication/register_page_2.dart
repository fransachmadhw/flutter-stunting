import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stunting/widgets/button/custom_back_button.dart';
import 'package:flutter_stunting/commons/globals.dart';
import 'package:flutter_stunting/widgets/button/primary_button.dart';
import 'package:flutter_stunting/widgets/input/custom_bordered_input.dart';
import 'package:iconify_flutter/icons/ph.dart';

class RegisterPage2 extends StatefulWidget {
  const RegisterPage2({super.key});

  @override
  State<StatefulWidget> createState() => _RegisterPage2State();
}

class _RegisterPage2State extends State<RegisterPage2> {
  TextEditingController usernameController = TextEditingController();
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
                  SizedBox(
                    height: spacing * 1,
                  ),
                  Wrap(
                    runSpacing: spacing * 2,
                    children: [
                      CustomBorderedInput(
                        controller: usernameController,
                        hintText: "Nama Lengkap",
                        onChanged: (e) {},
                        prefixIcon: Ph.user,
                      ),
                      CustomBorderedInput(
                        controller: usernameController,
                        hintText: "Nomor Induk Kependudukan",
                        onChanged: (e) {},
                        prefixIcon: Ph.identification_card,
                      ),
                      CustomBorderedInput(
                        controller: usernameController,
                        hintText: "Tempat, Tanggal Lahir",
                        onChanged: (e) {},
                        prefixIcon: Ph.identification_card,
                      ),
                      CustomBorderedInput(
                        controller: usernameController,
                        hintText: "Alamat KTP",
                        onChanged: (e) {},
                        prefixIcon: Ph.map_pin,
                      ),
                      CustomBorderedInput(
                        controller: usernameController,
                        hintText: "Alamat Domisili",
                        onChanged: (e) {},
                        prefixIcon: Ph.house,
                      ),
                    ],
                  ),
                ],
              ),
              PrimaryButton(
                onPressed: () {},
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