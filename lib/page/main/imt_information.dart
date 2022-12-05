import 'package:flutter/material.dart';
import 'package:flutter_stunting/commons/globals.dart';
import 'package:flutter_stunting/utils/string.dart';
import 'package:flutter_stunting/widgets/button/custom_back_button.dart';
import 'package:flutter_stunting/widgets/button/default_accordion.dart';
import 'package:gap/gap.dart';

class IMTInformation extends StatefulWidget {
  const IMTInformation({super.key});

  @override
  State<StatefulWidget> createState() => _IMTInformationState();
}

class _IMTInformationState extends State<IMTInformation> {
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
                  'Paham IMT',
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                SizedBox(
                  width: double.infinity,
                  height: spacing * 5,
                  child: Text(
                    'Mengetahui lebih detail tentang apa itu Indeks Massa Tubuh (IMT)',
                    textAlign: TextAlign.left,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: neutral200),
                  ),
                ),
                const Gap(spacing * 2),
                const DefaultAccordion(
                  title: "Apa itu Indeks Massa Tubuh (IMT)?",
                  content: AppConstants.imt,
                ),
                const Gap(spacing * 3),
                const DefaultAccordion(
                  title: "Bagaimana cara menghitung IMT?",
                  content: AppConstants.imt,
                ),
                const Gap(spacing * 3),
                const DefaultAccordion(
                  title: "Apa hubungan IMT dengan stunting?",
                  content: AppConstants.imt,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
