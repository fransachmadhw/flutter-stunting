import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_stunting/commons/globals.dart';
import 'package:flutter_stunting/page/main/bmi_calculator.dart';
import 'package:flutter_stunting/page/main/camera_screen.dart';
import 'package:flutter_stunting/page/main/edit_data.dart';
import 'package:flutter_stunting/page/main/feedback_page.dart';
import 'package:flutter_stunting/page/main/imt_information.dart';
import 'package:flutter_stunting/page/main/user_profile.dart';
import 'package:flutter_stunting/widgets/button/dashboard_button.dart';
import 'package:flutter_stunting/widgets/inkwell/news_inkwell.dart';
import 'package:iconify_flutter/icons/ph.dart';
import 'package:gap/gap.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:iconify_flutter/icons/ic.dart';
import 'package:iconify_flutter/icons/uil.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  // final UserModel? user;
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var userName = '';
  var userBMI = {};

  // Future logout() async {
  // final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   await FirebaseAuth.instance.signOut();
  //   if (GoogleSignIn().currentUser != null) {
  //     await GoogleSignIn().disconnect();
  //   }
  //   if (await FacebookAuth.instance.accessToken != null) {
  //     await FacebookAuth.instance.logOut();
  //   }
  // prefs.remove("user_data");
  // prefs.remove("user_health");

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
    initializeDateFormatting('id_ID', null);
    Intl.defaultLocale = 'id';
    getUserBMI();
  }

  void getUserBMI() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final obj = prefs.getString("user_health");
    if (obj != null) {
      final data = json.decode(obj);
      setState(() {
        userBMI = data;
      });
    }
  }

  String calculateBMI(int height, int weight) {
    double heightToM = height / 100;
    double imt = weight / (heightToM * heightToM);
    setState(() {
      userBMI["imt"] = imt;
    });
    return imt.toStringAsFixed(2);
  }

  String getIMTStatus() {
    final imt = userBMI["imt"] ?? 0;
    if (imt == 0) {
      return "No Data";
    } else if (imt < 18.5) {
      return "Kurus";
    } else if (imt >= 18.5 && imt < 22.9) {
      return "Normal";
    } else if (imt >= 22.9 && imt < 24.9) {
      return "Gemuk";
    } else {
      return "Obesitas";
    }
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

  void goToVerifyData() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const EditData()),
    );
  }

  void goToIMTinformation() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const IMTInformation()),
    );
  }

  void goToFeedback() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const FeedbackPage()),
    );
  }

  void goToCamera() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CameraScreen()),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 1) {
      goToCamera();
    }
    if (index == 2) {
      goToUserProfile();
    }
  }

  int _selectedIndex = 0;
  int airPutih = 0;

  void airPutihAdd() {
    setState(() {
      airPutih++;
    });
  }

  void airPutihReduce() {
    setState(() {
      airPutih--;
    });
  }

  final dt = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final newDtDay = DateFormat('d').format(dt);
    var newDtMonth = DateFormat('MMMM').format(dt);

    // if (newDtMonth == 'December') {
    //   newDtMonth = 'Desember';
    // }

    // final newDtmonth = DateFormat.MMM().format(dt);
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
                    Row(
                      children: [
                        const Iconify(
                          Ph.calendar_blank,
                          size: 20,
                        ),
                        const Gap(spacing - 4),
                        Text('$newDtDay $newDtMonth',
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(fontSize: 14)),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: spacing),
                SizedBox(
                  height: 180,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(right: spacing),
                        child: NewsInkwell(
                            imageUrl:
                                "https://primaya.b-cdn.net/wp-content/uploads/2021/07/Gejala-Stunting-pada-Anak-dan-Pencegahannya.jpg",
                            destinationUrl:
                                "https://primayahospital.com/anak/mencegah-anak-stunting/"),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: spacing),
                        child: NewsInkwell(
                          imageUrl:
                              "https://p2ptm.kemkes.go.id/uploads/VHcrbkVobjRzUDN3UCs4eUJ0dVBndz09/2017/stunting_01.png",
                          destinationUrl:
                              "https://p2ptm.kemkes.go.id/post/cegah-stunting-dengan-perbaikan-pola-makan-pola-asuh-dan-sanitasi",
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: spacing),
                        child: NewsInkwell(
                            imageUrl:
                                "https://yankes.kemkes.go.id/img/bg-img/gambarartikel_1661498786_242330.jpg",
                            destinationUrl:
                                "https://yankes.kemkes.go.id/view_artikel/1388/mengenal-apa-itu-stunting"),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: spacing * 3),
                Text(
                  'Dashboard',
                  textAlign: TextAlign.left,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(fontSize: 18, letterSpacing: 0.3),
                ),
                const Gap(spacing),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          width: 80,
                          height: 80,
                          child: DashboardButton(
                              icon: Ic.outline_system_security_update_good,
                              onPressed: () => goToVerifyData()),
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
                        SizedBox(
                            width: 80,
                            height: 80,
                            child: DashboardButton(
                                icon: Ic.outline_create,
                                onPressed: () => goToIMTinformation())),
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
                    // InkWell(
                    //   onTap: () => Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => const IMTInformation(),
                    //     ),
                    //   ),
                    //   child: Column(
                    //     mainAxisAlignment: MainAxisAlignment.center,
                    //     children: [
                    //        SizedBox(
                    //         width: 80,
                    //         height: 80,
                    //         child: DashboardButton(
                    //           icon: Ic.outline_help_outline,
                    //           onPressed: () => goToVerifyData())
                    //         ),
                    //       ),
                    //       // const Gap(spacing),
                    //       Text(
                    //         'Penjelasan\nStunting',
                    //         textAlign: TextAlign.center,
                    //         style: Theme.of(context)
                    //             .textTheme
                    //             .bodySmall!
                    //             .copyWith(height: 1.2),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    const Gap(spacing * 2),
                    Column(
                      children: [
                        SizedBox(
                          width: 80,
                          height: 80,
                          child: DashboardButton(
                              icon: Ic.outline_create,
                              onPressed: () => goToFeedback()),
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
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(white.withAlpha(0)),
                            shadowColor: MaterialStateProperty.all(
                                primary400.withAlpha(0))),
                        child: const Iconify(
                          Ph.arrow_right,
                          // size: 24,
                        ),
                      ),
                    )
                  ],
                ),
                const Gap(spacing - 6),
                Padding(
                  padding: const EdgeInsets.only(left: 0, right: 0),
                  child: Container(
                    padding: const EdgeInsets.all(spacing * 3),
                    height: 180,
                    decoration: const BoxDecoration(
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Berat",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: 0.3)),
                            Text("${userBMI["weight"] ?? "--"} kg",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 0.3))
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("${userBMI["height"] ?? "--"} cm",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(
                                            fontWeight: FontWeight.w500,
                                            letterSpacing: 0.3)),
                                Text("Tinggi",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(
                                            color: neutral400,
                                            fontWeight: FontWeight.w500,
                                            letterSpacing: 0.3))
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    "${userBMI["weight"] != null && userBMI["height"] != null ? calculateBMI(int.parse(userBMI["height"]), int.parse(userBMI["weight"])) : "--"} IMT",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(
                                            fontWeight: FontWeight.w500,
                                            letterSpacing: 0.3)),
                                Text(getIMTStatus(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(
                                            color: neutral400,
                                            fontWeight: FontWeight.w500,
                                            letterSpacing: 0.3))
                              ],
                            )
                          ],
                        )
                      ],
                    ),
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
                      padding: const EdgeInsets.all(spacing * 3),
                      height: 180,
                      decoration: const BoxDecoration(
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("$airPutih dari 8 gelas",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: 0.3)),
                              Text("Rutinitas 8 gelas air putih",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                          fontWeight: FontWeight.w400,
                                          letterSpacing: 0.3)),
                              const Gap(spacing * 1.5),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 50,
                                    height: 50,
                                    child: ElevatedButton(
                                      onPressed: () => airPutihAdd(),
                                      style: ElevatedButton.styleFrom(
                                          shape:
                                              const CircleBorder(), //<-- SEE HERE
                                          padding: const EdgeInsets.all(0),
                                          backgroundColor: white),
                                      child: const Iconify(Ph.plus),
                                    ),
                                  ),
                                  const Gap(spacing),
                                  SizedBox(
                                    width: 50,
                                    height: 50,
                                    child: ElevatedButton(
                                      onPressed: () => airPutihReduce(),
                                      style: ElevatedButton.styleFrom(
                                          shape:
                                              const CircleBorder(), //<-- SEE HERE
                                          padding: const EdgeInsets.all(0),
                                          backgroundColor: white),
                                      child: const Iconify(Ph.minus),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            width: 80,
                            height: 80,
                            child: Image.asset('assets/images/water1.png'),
                          )
                        ],
                      )),
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
        backgroundColor: white,
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
