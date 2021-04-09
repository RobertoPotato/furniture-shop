import 'package:flutter/material.dart';

/// Text form field builder
buildTextFormField({
  @required String label,
  @required FormFieldValidator<String> validator,
  @required TextEditingController controller,
  TextInputType textInputType,
  String hintText,
  int maxLines,
}) {
  return TextFormField(
    keyboardType: textInputType == null ? TextInputType.text : textInputType,
    decoration: InputDecoration(
      labelText: label,
      hintText: hintText == null ? null : hintText,
    ),
    maxLines: maxLines == null ? 1 : maxLines,
    validator: validator,
    controller: controller,
  );
}


