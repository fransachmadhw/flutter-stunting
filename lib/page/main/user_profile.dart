import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_stunting/commons/globals.dart';
import 'package:flutter_stunting/page/main/home_page.dart';
import 'package:flutter_stunting/widgets/button/custom_back_button.dart';
import 'package:gap/gap.dart';

class UserProfile extends StatefulWidget {
  final String? userName;
  const UserProfile({super.key, this.userName});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    String? userName = widget.userName;
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(
            horizontal: spacing * 3, vertical: spacing * 3),
        width: MediaQuery.of(context).size.width,
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [CustomBackButton()],
                ),
                Gap(spacing * 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                          color: primary300,
                          borderRadius: BorderRadius.circular(radius * 10),
                          boxShadow: [
                            BoxShadow(
                                color: neutral50,
                                spreadRadius: -10,
                                blurRadius: 25,
                                offset: Offset(0, 10))
                          ]),
                      child: Image.asset('assets/images/doctor_male.png'),
                    ),
                    Gap(spacing * 3),
                    Text(
                      userName != null ? userName : '',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    )));
  }
}
