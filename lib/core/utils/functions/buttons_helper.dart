import 'package:flutter/material.dart';

TextStyle getTextStyle() {
  return TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );
}

EdgeInsets getPadding({double? horizontal, double? vertical}) {
  return EdgeInsets.symmetric(
    horizontal: horizontal ?? 28,
    vertical: vertical ?? 12,
  );
}

RoundedRectangleBorder getShape() {
  return RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(12),
  );
}