import 'package:flutter/material.dart';

import '../../../../constants.dart';
import '../../../../core/utils/functions/buttons_helper.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.onPressed,
    required this.title,
  });

  final void Function() onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      iconAlignment: IconAlignment.end,
      onPressed: onPressed,
      child: Text(title, style: getTextStyle()),
      style: ElevatedButton.styleFrom(
        minimumSize: Size(double.infinity, 0),
        backgroundColor: KPrimaryColor,
        foregroundColor: Colors.white,
        //fixedSize: Size(147, 56),
        padding: getPadding(vertical: 16),
        shape: getShape(),
      ),
    );
  }
}
