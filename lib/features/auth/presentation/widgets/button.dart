import 'package:flutter/material.dart';

import '../../../../constants.dart';
import '../../../../core/utils/helperFunctions.dart';


class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.onPressed,
    required this.title,
    required this.isLoading,
  });

  final void Function() onPressed;
  final String title;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      iconAlignment: IconAlignment.end,
      onPressed: onPressed,
      child: isLoading
          ? const SizedBox(
              height: 24,
              width: 24,
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            )
          : Text(title, style: getTextStyle()),
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
