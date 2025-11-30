import 'package:event_manager/theams/app_colors.dart';
import "package:flutter/material.dart";

InputDecoration textBoxStyle({IconData? prefixIcon, String? hintText, bool hasSuffixIcon = false, Widget? suffixIcon}) {
  return InputDecoration(
    errorStyle: TextStyle(color: errorColor, fontSize: 14),
    prefixIcon: Icon(prefixIcon),
    hintText: hintText ?? "",
    suffixIcon: (hasSuffixIcon) ? suffixIcon : null,
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: primaryColor, width: 1.0),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: errorColor, width: 1.0),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: errorColor, width: 1.0),
    ),
    border: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10))
    ),
    hintStyle: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: shimmerColor,
    ),
  );
}

final TextStyle textFieldTextStyle = TextStyle(
  color: textPrimaryColor,
  fontWeight: FontWeight.w500
);
