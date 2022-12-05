import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_stunting/page/main/home_page.dart';
import 'package:flutter_stunting/widgets/button/custom_back_button.dart';
import 'package:flutter_stunting/commons/globals.dart';
import 'package:flutter_stunting/widgets/button/primary_button.dart';
import 'package:flutter_stunting/widgets/dialog/success_dialog.dart';
import 'package:flutter_stunting/widgets/input/custom_bordered_input.dart';
import 'package:iconify_flutter/icons/ph.dart';

class EditData extends StatefulWidget {
  const EditData({super.key});

  @override
  State<EditData> createState() => _EditDataState();
}

class _EditDataState extends State<EditData> {
  var fullNameController = TextEditingController();
  var nikController = TextEditingController();
  var dateOfBirthController = TextEditingController();
  var addressController = TextEditingController();

  void goToHome() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const HomePage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    fullNameController.text = "Bayu Fredipo";
    nikController.text = "3501XXXXXXXXXX";
    dateOfBirthController.text = "31 Februari 1997";
    addressController.text = "Jalan Jakarta Gatau Lanjutannya";

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
                    Text('Verifikasi Data Personal',
                        textAlign: TextAlign.left,
                        style: Theme.of(context).textTheme.headlineSmall),
                    // SizedBox(height: spacing),
                    SizedBox(
                      width: 254,
                      height: spacing * 5,
                      child: Text(
                          'Periksa kembali data yang sudah anda isikan sebelumnya.',
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
                          // onChanged: (e) => setForm("fullName", e),
                          onChanged: (e) => {},
                          prefixIcon: Ph.user,
                          controller: fullNameController,
                        ),
                        CustomBorderedInput(
                          hintText: "Nomor Induk Kependudukan",
                          // onChanged: (e) => setForm("nik", e),
                          onChanged: (e) => {},
                          prefixIcon: Ph.identification_card,
                          controller: nikController,
                        ),
                        CustomBorderedInput(
                          hintText: "Tanggal Lahir",
                          // onChanged: (e) => setForm("dateOfBirth", e),
                          onChanged: (e) => {},
                          prefixIcon: Ph.identification_card,
                          controller: dateOfBirthController,
                        ),
                        CustomBorderedInput(
                          hintText: "Alamat Domisili",
                          // onChanged: (e) => setForm("address", e),
                          onChanged: (e) => {},
                          prefixIcon: Ph.house,
                          controller: addressController,
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: spacing * 2),
                // Text(
                //   errMsg,
                //   textAlign: TextAlign.center,
                //   style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                //         fontWeight: FontWeight.w500,
                //         color: red400,
                //       ),
                // ),
                const SizedBox(height: spacing * 2),
                PrimaryButton(
                  isLoading: false,
                  onPressed: () => goToHome(),
                  // onPressed: () {
                  //   showDialog(
                  //     context: context,
                  //     builder: (BuildContext context) => SuccessDialog(
                  //         onPressed: () => {Navigator.of(context).pop()}),
                  //   );
                  // },
                  title: 'Simpan',
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
