import 'package:flutter/material.dart';
import 'package:flutter_stunting/commons/globals.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';

class CustomDropdownInput extends StatelessWidget {
  final bool? isPassword;
  final ValueChanged<dynamic> onChanged;
  final TextEditingController? controller;
  final String? suffixIcon, prefixIcon, hintText;
  final TextInputType? inputType;

  const CustomDropdownInput(
      {super.key,
      required this.onChanged,
      this.controller,
      this.suffixIcon,
      this.prefixIcon,
      this.hintText,
      this.isPassword,
      this.inputType});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          vertical: spacing / 2, horizontal: spacing * 2),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(color: neutral50, width: 1),
      ),
      child: DropDownTextField(
        // initialValue: "",
        textStyle:
            Theme.of(context).textTheme.bodyMedium!.copyWith(color: black),
        listSpace: 20,
        listPadding: ListPadding(top: 20),
        enableSearch: false,
        validator: (value) {
          if (value == null) {
            return "Required field";
          } else {
            return null;
          }
        },
        dropDownList: const [
          DropDownValueModel(name: 'Laki-laki', value: "laki-laki"),
          DropDownValueModel(name: 'Perempuan', value: "perempuan"),
        ],
        // listTextStyle: const TextStyle(color: Colors.red),
        dropDownItemCount: 2,
        onChanged: onChanged,
        textFieldDecoration: InputDecoration(
          // suffixIcon: suffixIcon != null
          //     ? Iconify(suffixIcon!, color: neutral200)
          //     : null,
          // suffixIconConstraints: const BoxConstraints(
          //   minWidth: spacing * 3,
          //   maxWidth: spacing * 3,
          //   minHeight: spacing * 3,
          //   maxHeight: spacing * 3,
          // ),
          prefixIcon: prefixIcon != null
              ? Iconify(prefixIcon!, color: neutral200)
              : null,
          prefixIconConstraints: const BoxConstraints(
            minWidth: spacing * 3,
            maxWidth: spacing * 3,
            minHeight: spacing * 3,
            maxHeight: spacing * 3,
          ),
          hintText: hintText ?? "Placeholder...",
          hintStyle: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: neutral200),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.all(20.0),
        ),
      ),
    );
  }
}
