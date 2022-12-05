import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_stunting/page/main/home_page.dart';
import 'package:flutter_stunting/widgets/button/custom_back_button.dart';
import 'package:flutter_stunting/commons/globals.dart';
import 'package:flutter_stunting/widgets/button/primary_button.dart';
import 'package:flutter_stunting/widgets/dialog/success_dialog.dart';
import 'package:flutter_stunting/widgets/input/custom_bordered_input.dart';
import 'package:flutter_stunting/widgets/input/feedback_input.dart';
import 'package:iconify_flutter/icons/ph.dart';

class FeedbackPage extends StatefulWidget {
  const FeedbackPage({super.key});

  @override
  State<FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  var kelebihanController = TextEditingController();
  var kekuranganController = TextEditingController();

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
                    Text('Penilaian Aplikasi',
                        textAlign: TextAlign.left,
                        style: Theme.of(context).textTheme.headlineSmall),
                    // SizedBox(height: spacing),
                    SizedBox(
                      width: 254,
                      height: spacing * 5,
                      child: Text(
                          'Kritik dan saran Anda sangat dibutuhkan guna meningkatkan kinerja kami.',
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
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Kelebihan Aplikasi',
                                textAlign: TextAlign.left,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(fontWeight: FontWeight.w500)),
                            FeedbackInput(
                              // onChanged: (e) => setForm("fullName", e),
                              onChanged: (e) => {},
                              controller: kelebihanController,
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Kekurangan Aplikasi',
                                textAlign: TextAlign.left,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(fontWeight: FontWeight.w500)),
                            FeedbackInput(
                              // onChanged: (e) => setForm("fullName", e),
                              onChanged: (e) => {},
                              controller: kekuranganController,
                            ),
                          ],
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
                  title: 'Kirim',
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
