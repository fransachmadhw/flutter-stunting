import 'package:flutter/material.dart';
import 'package:flutter_stunting/commons/globals.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
// import 'package:iconify_flutter/icons/ic.dart';
// import 'package:iconify_flutter/icons/ph.dart';

class DashboardButton extends StatelessWidget {
  // final Function onPressed;
  final String? icon;
  // final double size;

  const DashboardButton({
    super.key,
    // required this.onPressed,
    required this.icon,
    // required this.size
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => {},
      // style: col,
      child: Iconify(
        icon!,
        size: 32,
      ),
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(0),
        backgroundColor: MaterialStateProperty.all(
          white,
        ),
        // padding: MaterialStateProperty.all(
        //   const EdgeInsets.symmetric(vertical: spacing * 2),
        // ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
            // side: BorderSide(
            //   color: primary500,
            //   width: 2,
            // ),
          ),
        ),
      ),
    );
  }
}
