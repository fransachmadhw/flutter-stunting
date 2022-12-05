import 'package:flutter/material.dart';
import 'package:flutter_stunting/commons/globals.dart';
import 'package:iconify_flutter/iconify_flutter.dart';

class FeedbackInput extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final TextEditingController? controller;
  final String? hintText;

  const FeedbackInput({
    super.key,
    required this.onChanged,
    this.controller,
    this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          vertical: spacing / 2, horizontal: spacing * 1),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(color: neutral50, width: 1),
      ),
      child: TextField(
        minLines: 6,
        maxLines: 8,
        controller: controller,
        onChanged: onChanged,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: black),
        decoration: InputDecoration(
          // suffixIcon: suffixIcon != null
          //     ? Iconify(suffixIcon!, color: neutral200)
          //     : null,
          // suffixIconConstraints: const BoxConstraints(
          //   minWidth: spacing * 3,
          //   maxWidth: spacing * 3,
          //   minHeight: spacing * 3,
          //   maxHeight: spacing * 3,
          // ),
          // prefixIcon: prefixIcon != null
          //     ? Iconify(prefixIcon!, color: neutral200)
          //     : null,
          // prefixIconConstraints: const BoxConstraints(
          //   minWidth: spacing * 3,
          //   maxWidth: spacing * 3,
          //   minHeight: spacing * 3,
          //   maxHeight: spacing * 3,
          // ),
          hintText: hintText ?? "",
          hintStyle: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: neutral200),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.all(10.0),
        ),
      ),
    );
  }
}
