import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_stunting/commons/globals.dart';
import 'package:flutter_stunting/page/main/home_page.dart';
import 'package:flutter_stunting/widgets/button/custom_back_button.dart';
import 'package:flutter_stunting/widgets/button/primary_button.dart';
import 'package:flutter_stunting/widgets/dialog/success_dialog.dart';
import 'package:flutter_stunting/widgets/input/custom_bordered_input.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BMICalculator extends StatefulWidget {
  const BMICalculator({super.key});

  @override
  State<BMICalculator> createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  final ageController = TextEditingController();
  final genderController = TextEditingController();
  final heightController = TextEditingController();
  final weightController = TextEditingController();
  var userBMI = {};

  void openDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) => SuccessDialog(
        title: "Hasil Analisis",
        subTitle: "Anda positif stunting",
        onPressed: () => goToHome(),
      ),
    );
  }

  void goToHome() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const HomePage(),
      ),
    );
  }

  void submitData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("user_health", json.encode(userBMI));
    openDialog();
  }

  void setData(value, target) {
    setState(() {
      userBMI[target] = value;
    });
  }

  void getUserBMI() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final data = prefs.getString("user_health");
    if (data != null) {
      final decode = json.decode(data);
      setState(() {
        userBMI["age"] = decode["age"];
        userBMI["gender"] = decode["gender"];
        userBMI["height"] = decode["height"];
        userBMI["weight"] = decode["weight"];
      });
      setFormValue(decode);
    }
  }

  void setFormValue(data) {
    ageController.text = data["age"].toString();
    genderController.text = data["gender"].toString();
    heightController.text = data["height"].toString();
    weightController.text = data["weight"].toString();
  }

  @override
  void initState() {
    super.initState();
    getUserBMI();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(spacing * 3),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [CustomBackButton()],
                ),
                const SizedBox(height: spacing * 2),
                Text(
                  'Indikator Setting',
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                SizedBox(
                  width: double.infinity,
                  height: spacing * 5,
                  child: Text(
                    'Calculate Gizi anak untuk mendeteksi Stunting',
                    textAlign: TextAlign.left,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: neutral200),
                  ),
                ),
                const SizedBox(height: spacing * 2),
                Wrap(
                  runSpacing: spacing * 2,
                  children: [
                    CustomBorderedInput(
                      controller: ageController,
                      onChanged: (e) => setData(e, "age"),
                      inputType: TextInputType.number,
                      hintText: "Usia",
                      prefixIcon: Mdi.account_outline,
                    ),
                    CustomBorderedInput(
                      controller: genderController,
                      onChanged: (e) => setData(e, "gender"),
                      hintText: "Jenis Kelamin",
                      prefixIcon: Mdi.account_supervisor_outline,
                    ),
                    CustomBorderedInput(
                      controller: heightController,
                      onChanged: (e) => setData(e, "height"),
                      inputType: TextInputType.number,
                      hintText: "Tinggi Badan",
                      prefixIcon: Mdi.arrow_split_horizontal,
                    ),
                    CustomBorderedInput(
                      controller: weightController,
                      onChanged: (e) => setData(e, "weight"),
                      inputType: TextInputType.number,
                      hintText: "Berat Badan",
                      prefixIcon: Mdi.arrow_split_vertical,
                    ),
                  ],
                ),
                const SizedBox(height: spacing * 6),
                PrimaryButton(
                  onPressed: () => submitData(),
                  title: "Hitung",
                  type: ButtonType.primary,
                  isLoading: false,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
