import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../constants.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField(
      {super.key,
      required this.controller,
      required this.hintText,
      this.prefixIcon,
      required this.labelText,
      this.suffixIcon,
      required this.keyboardType,
      this.onChanged});

  final TextEditingController controller;
  final String hintText;
  final String labelText;
  final Widget? prefixIcon;
  final IconData? suffixIcon;
  final TextInputType keyboardType;
  final void Function(String)? onChanged;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool visibility = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.suffixIcon == null
          ? false
          : visibility
              ? false
              : true,
      keyboardType: widget.keyboardType,
      onChanged: widget.onChanged,
      validator: (val) {
        if (val!.isEmpty) {
          return 'field is required';
        }
        return null;
      },
      decoration: InputDecoration(
        filled: true,
        fillColor: KTextFieldColor,
        labelText: widget.labelText,
        hintText: widget.hintText,
        prefixIcon: widget.prefixIcon ?? null,
        suffixIcon: GestureDetector(
            onTap: () {
              visibility = !visibility;
              setState(() {});
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FaIcon(
                  visibility == false
                      ? widget.suffixIcon
                      : FontAwesomeIcons.eye,
                  size: 22,
                ),
              ],
            )),
        border: getBorder(),
        enabledBorder: getBorder(),
        errorBorder: getBorder(color: Colors.red),
        focusedBorder: getBorder(color: KPrimaryColor),
      ),
    );
  }

  OutlineInputBorder getBorder({Color? color}) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: color ?? KTextFieldColor));
  }
}
