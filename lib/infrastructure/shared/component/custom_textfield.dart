import 'package:flutter/material.dart';

import '../utils/utils.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    required this.hint,
    this.multiline = false,
    this.inputType = TextInputType.text,
    required this.controller,
  });

  final String hint;
  final bool multiline;
  final TextInputType inputType;

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    int line = 1;
    if (multiline) {
      line = 6;
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          minLines: line,
          maxLines: line,
          controller: controller,
          keyboardType: inputType,
          decoration: themeInputDecoration(hintText: hint),
        )
      ],
    );
  }
}
