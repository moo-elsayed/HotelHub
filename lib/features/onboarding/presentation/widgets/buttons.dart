import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hotel_hub/constants.dart';

class ButtonNext extends StatelessWidget {
  const ButtonNext({
    super.key,
    required this.onPressed,
    required this.title,
  });

  final void Function() onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      iconAlignment: IconAlignment.end,
      onPressed: onPressed,
      label: Text(
        title,
        style: getTextStyle(),
      ),
      icon: SvgPicture.asset('assets/images/arrow-right.svg'),
      style: ElevatedButton.styleFrom(
        backgroundColor: KPrimaryColor,
        foregroundColor: Colors.white,
        //fixedSize: Size(147, 56),
        padding: getPadding(),
        shape: getShape(),
      ),
    );
  }
}

class ButtonSkip extends StatelessWidget {
  const ButtonSkip({super.key, required this.onPressed});

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        'Skip',
        style: getTextStyle(),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        padding: getPadding(),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
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
