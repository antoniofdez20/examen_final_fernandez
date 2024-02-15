import 'package:examen_final_fernandez/utils/custom_colors.dart';
import 'package:flutter/material.dart';

class CustomInputDecorations {
  static InputDecoration buildInputDecoration({
    required String labelText,
    Widget? suffixIcon,
  }) {
    return InputDecoration(
      labelText: labelText,
      labelStyle: const TextStyle(color: MyColors.greenVogue),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: MyColors.easternBlue,
          width: 2,
        ),
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: MyColors.greenVogue,
          width: 2,
        ),
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      filled: true,
      fillColor: MyColors.easternBlue,
      suffixIcon: suffixIcon,
    );
  }
}
