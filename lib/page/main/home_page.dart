import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_stunting/commons/globals.dart';
import 'package:flutter_stunting/data/model/user_model.dart';
import 'package:flutter_stunting/page/authentication/login_page.dart';
import 'package:flutter_stunting/page/main/bmi_calculator.dart';
import 'package:flutter_stunting/page/main/user_profile.dart';
import 'package:flutter_stunting/widgets/button/dashboard_button.dart';
import 'package:flutter_stunting/widgets/button/primary_button.dart';
import 'package:flutter_stunting/widgets/inkwell/news_inkwell.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:iconify_flutter/icons/ph.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:gap/gap.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:iconify_flutter/icons/ic.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  // final UserModel? user;
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var userName = '';

  // Future logout() async {
  //   await FirebaseAuth.instance.signOut();
  //   if (GoogleSignIn().currentUser != null) {
  //     await GoogleSignIn().disconnect();
  //   }
  //   if (await FacebookAuth.instance.accessToken != null) {
  //     await FacebookAuth.instance.logOut();
  //   }

  //   goToLogin();
  // }

  // void goToLogin() {
  //   Navigator.pushReplacement(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) => const LoginPage(),
  //     ),
  //   );
  // }

  // Future<dynamic> getUserData() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   UserModel user =
  //       UserModel.fromJson(json.decode(prefs.getString("user_data")!));
  //   print(user.fullName);
  // }

  @override
  void initState() {
    super.initState();
    // getUserName();
    // getUserData();
  }

  void goToCalculator() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const BMICalculator()),
    );
  }

  void goToUserProfile() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const UserProfile()),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 2) {
      goToUserProfile();
    }
    ;
  }

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(spacing * 2),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Text('Selamat Datang! ${userName != '' ? userName : ''}',
                //     textAlign: TextAlign.center,
                //     style: Theme.of(context).textTheme.headlineSmall),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Halo, Bayu!',
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(fontSize: 18)),
                    Text('24 November 2022',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodySmall),
                  ],
                ),
                SizedBox(
                  height: spacing,
                ),
                SizedBox(
                  height: 180,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: spacing),
                        child: NewsInkwell(
                          imageUrl:
                              "https://p2ptm.kemkes.go.id/uploads/VHcrbkVobjRzUDN3UCs4eUJ0dVBndz09/2017/stunting_01.png",
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: spacing),
                        child: NewsInkwell(
                          imageUrl:
                              "https://primaya.b-cdn.net/wp-content/uploads/2021/07/Gejala-Stunting-pada-Anak-dan-Pencegahannya.jpg",
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: spacing),
                        child: NewsInkwell(
                          imageUrl:
                              "https://yankes.kemkes.go.id/img/bg-img/gambarartikel_1661498786_242330.jpg",
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: spacing * 3,
                ),
                Text('Dashboard',
                    textAlign: TextAlign.left,
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(fontSize: 18, letterSpacing: 0.3)),
                const Gap(spacing),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        const SizedBox(
                          width: 80,
                          height: 80,
                          child: DashboardButton(
                            icon: Ic.outline_system_security_update_good,
                          ),
                        ),
                        const Gap(spacing),
                        Text(
                          'Verifikasi\nData',
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(height: 1.2),
                        ),
                      ],
                    ),
                    const Gap(spacing * 2),
                    Column(
                      children: [
                        const SizedBox(
                          width: 80,
                          height: 80,
                          child: DashboardButton(
                            icon: Ic.outline_help_outline,
                          ),
                        ),
                        const Gap(spacing),
                        Text(
                          'Penjelasan\nStunting',
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(height: 1.2),
                        ),
                      ],
                    ),
                    const Gap(spacing * 2),
                    Column(
                      children: [
                        const SizedBox(
                          width: 80,
                          height: 80,
                          child: DashboardButton(
                            icon: Ic.outline_create,
                          ),
                        ),
                        const Gap(spacing),
                        Text(
                          'Tulis\nFeedback',
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(height: 1.2),
                        ),
                      ],
                    ),
                  ],
                ),
                const Gap(spacing * 3),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Indeks Massa Tubuh',
                        textAlign: TextAlign.left,
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(fontSize: 18, letterSpacing: 0.3)),
                    SizedBox(
                      width: 55,
                      height: 55,
                      child: ElevatedButton(
                        onPressed: () => goToCalculator(),
                        child: Iconify(
                          Ph.arrow_right,
                          // size: 24,
                        ),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(white.withAlpha(0)),
                            shadowColor: MaterialStateProperty.all(
                                primary400.withAlpha(0))),
                      ),
                    )
                  ],
                ),
                const Gap(spacing - 6),
                Padding(
                  padding: const EdgeInsets.only(left: 0, right: 0),
                  child: Container(
                    padding: const EdgeInsets.all(spacing * 2),
                    height: 180,
                    decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(radius - 4),
                            topRight: Radius.circular(100),
                            bottomLeft: Radius.circular(radius - 4),
                            bottomRight: Radius.circular(radius - 4)),
                        boxShadow: [
                          BoxShadow(
                              color: neutral50,
                              spreadRadius: -10,
                              blurRadius: 25,
                              offset: Offset(0, 10))
                        ]),
                  ),
                ),
                const Gap(spacing * 2),
                Text('Air Putih',
                    textAlign: TextAlign.left,
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(fontSize: 18, letterSpacing: 0.3)),
                const Gap(spacing * 2),
                Padding(
                  padding: const EdgeInsets.only(left: 0, right: 0),
                  child: Container(
                    padding: const EdgeInsets.all(spacing * 2),
                    height: 180,
                    decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(radius - 4),
                            topRight: Radius.circular(100),
                            bottomLeft: Radius.circular(radius - 4),
                            bottomRight: Radius.circular(radius - 4)),
                        boxShadow: [
                          BoxShadow(
                              color: neutral50,
                              spreadRadius: -10,
                              blurRadius: 25,
                              offset: Offset(0, 10))
                        ]),
                  ),
                ),
                // Text('Selamat Datang! ${userName != '' ? userName : ''}',
                //     textAlign: TextAlign.center,
                //     style: Theme.of(context).textTheme.headlineSmall),
                // const SizedBox(height: spacing * 4),
                // PrimaryButton(
                //     onPressed: () => logout(),
                //     title: 'Sign Out',
                //     type: ButtonType.primary)
                // Text(
                //   'Selamat Datang!',
                //   textAlign: TextAlign.center,
                //   style: Theme.of(context).textTheme.headlineSmall,
                // ),
                // const SizedBox(height: spacing * 4),
                // PrimaryButton(
                //     isLoading: false,
                //     onPressed: () => logout(),
                //     title: 'Sign Out',
                //     type: ButtonType.primary)
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 10,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Iconify(Ic.outline_home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Iconify(Mdi.camera_focus),
            label: 'Camera',
          ),
          BottomNavigationBarItem(
            icon: Iconify(Ph.user),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: onTabTapped,
        // currentIndex: 2,
      ),
    );
  }
}
