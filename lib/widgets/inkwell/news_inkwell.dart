import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_stunting/commons/globals.dart';

class NewsInkwell extends StatelessWidget {
  final String imageUrl;
  const NewsInkwell({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: 308,
        height: 180,
        decoration: BoxDecoration(
            color: primary300,
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
                image: NetworkImage(imageUrl), fit: BoxFit.cover),
            boxShadow: [
              // BoxShadow(
              //   color: Colors.grey.shade600,
              //   spreadRadius: 1,
              //   blurRadius: 15,
              //   offset: const Offset(5, 5),
              // ),
            ]),
      ),
    );
  }
}
