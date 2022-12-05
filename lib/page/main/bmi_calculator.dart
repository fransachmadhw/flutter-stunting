import 'package:flutter/material.dart';
import 'package:flutter_stunting/commons/globals.dart';
import 'package:flutter_stunting/page/main/home_page.dart';
import 'package:flutter_stunting/widgets/button/custom_back_button.dart';
import 'package:flutter_stunting/widgets/button/primary_button.dart';
import 'package:flutter_stunting/widgets/dialog/success_dialog.dart';
import 'package:flutter_stunting/widgets/input/custom_bordered_input.dart';
import 'package:iconify_flutter/icons/mdi.dart';

class BMICalculator extends StatefulWidget {
  const BMICalculator({super.key});

  @override
  State<BMICalculator> createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
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
                      onChanged: (e) {},
                      hintText: "Usia",
                      prefixIcon: Mdi.account_outline,
                    ),
                    CustomBorderedInput(
                      onChanged: (e) {},
                      hintText: "Jenis Kelamin",
                      prefixIcon: Mdi.account_supervisor_outline,
                    ),
                    CustomBorderedInput(
                      onChanged: (e) {},
                      hintText: "Tinggi Badan",
                      prefixIcon: Mdi.arrow_split_vertical,
                    ),
                    CustomBorderedInput(
                      onChanged: (e) {},
                      hintText: "Berat Badan",
                      prefixIcon: Mdi.arrow_split_horizontal,
                    ),
                  ],
                ),
                const SizedBox(height: spacing * 6),
                PrimaryButton(
                  onPressed: () => openDialog(),
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
