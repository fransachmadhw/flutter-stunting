import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_stunting/commons/globals.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsInkwell extends StatelessWidget {
  final String? imageUrl;
  final String? destinationUrl;
  const NewsInkwell({
    super.key,
    this.imageUrl,
    this.destinationUrl,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        final url = Uri.parse(
          destinationUrl!,
        );
        launchUrl(url, mode: LaunchMode.externalApplication);
      },
      child: Container(
        width: 308,
        height: 180,
        decoration: BoxDecoration(
            color: primary300,
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
                image: NetworkImage(imageUrl ?? ''), fit: BoxFit.cover),
            boxShadow: []),
      ),
    );
  }
}
