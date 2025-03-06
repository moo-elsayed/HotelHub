import 'package:flutter/material.dart';

class PasswordRequirement extends StatelessWidget {
  const PasswordRequirement(
      {super.key, required this.text, required this.isMet});

  final String text;
  final bool isMet;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(text),
        Spacer(),
        Icon(
          isMet ? Icons.check_circle : Icons.cancel,
          color: isMet ? Colors.green : Colors.red,
        ),
      ],
    );
  }
}

class PasswordRequirementBuilder extends StatelessWidget {
  const PasswordRequirementBuilder({super.key, required this.list});

  final List<Map<String, dynamic>> list;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        list.length,
        (index) {
          return PasswordRequirement(
            text: list[index]['text'],
            isMet: list[index]['isMet'],
          );
        },
      ),
    );
  }
}
