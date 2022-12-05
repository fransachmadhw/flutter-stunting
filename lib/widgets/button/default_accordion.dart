import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stunting/commons/globals.dart';
import 'package:getwidget/components/accordion/gf_accordion.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ic.dart';

class DefaultAccordion extends StatelessWidget {
  final String title, content;
  const DefaultAccordion(
      {super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return GFAccordion(
      title: title,
      content: content,
      margin: EdgeInsets.zero,
      titleBorder: Border.all(color: primary400, width: spacing / 4),
      titleBorderRadius: BorderRadius.circular(spacing + 4),
      expandedTitleBackgroundColor: Colors.transparent,
      collapsedIcon: const Iconify(
        Ic.round_arrow_circle_up,
        color: primary400,
      ),
      expandedIcon: const Iconify(
        Ic.round_arrow_circle_down,
        color: primary400,
      ),
    );
  }
}
