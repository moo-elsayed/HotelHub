import 'dart:developer';

import 'package:flutter/material.dart';

import '../../shared_preferences_manager.dart';

Future<bool> checkLoginStatus() async {
  String? token = await SharedPreferencesManager.getAuthToken();
  String? expiresOn = await SharedPreferencesManager.getExpiresOn();

  if (token != null && token.isNotEmpty) {
    log("User is logged in with token: $token");

    if (expiresOn == null || expiresOn.isEmpty) {
      log("Invalid expiresOn date. Redirecting to login...");
      await SharedPreferencesManager.clearUserData();
      return false;
    }

    try {
      DateTime expiryDate = DateTime.parse(expiresOn);
      if (DateTime.now().isAfter(expiryDate)) {
        log("Token expired, redirecting to login...");
        await SharedPreferencesManager.clearUserData();
        return false;
      } else {
        log("Token is valid, user remains logged in.");
        return true;
      }
    } catch (e) {
      log("Error parsing expiresOn: $e");
      await SharedPreferencesManager.clearUserData();
      return false;
    }
  } else {
    log("User is not logged in");
    return false;
  }
}

bool hasDigit(String pass) => pass.contains(RegExp(r'[0-9]'));

bool hasMinLength(String pass) => pass.length >= 6;

bool hasUppercase(String pass) => pass.contains(RegExp(r'[A-Z]'));

bool hasLowercase(String pass) => pass.contains(RegExp(r'[a-z]'));

bool hasSpecialChar(String pass) =>
    pass.contains(RegExp(r'[!@#\$%^&*(),.?":{}|<>]'));

List<Map<String, dynamic>> getPasswordRequirementList({required String pass}) {
  List<Map<String, dynamic>> list = [
    {
      'text': 'At least 1 digit (0-9)',
      'isMet': hasDigit(pass),
    },
    {
      'text': 'At least 6 characters',
      'isMet': hasMinLength(pass),
    },
    {
      'text': 'At least 1 uppercase letter',
      'isMet': hasUppercase(pass),
    },
    {
      'text': 'At least 1 lowercase letter',
      'isMet': hasLowercase(pass),
    },
    {
      'text': 'At least 1 special character',
      'isMet': hasSpecialChar(pass),
    }
  ];
  return list;
}

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
