import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_stunting/commons/globals.dart';

class NewsInkwell extends StatelessWidget {
  const NewsInkwell({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: 308,
        height: 150,
        decoration: BoxDecoration(
            color: primary300, borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
