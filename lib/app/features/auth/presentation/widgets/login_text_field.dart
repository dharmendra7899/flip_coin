import 'package:flip_coin/app/core/custom/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool obscureText;
  final String? labelText;
  final TextInputType? keyboardType;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Function(String)? onChanged;
  final List<TextInputFormatter> inputFormatters;
  final String? Function(String?)? validator;
  final AutovalidateMode? autoValidateMode;
  final bool readOnly;

  const LoginTextField({
    super.key,
    required this.hintText,
    this.labelText,
    this.keyboardType,
    this.prefixIcon,
    this.onChanged,
    required this.controller,
    this.obscureText = false,
    this.suffixIcon,
    this.inputFormatters = const [],
    this.validator,
    this.autoValidateMode,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      onChanged: onChanged,
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      prefixIcon: prefixIcon,
      validator: validator,
      hintText: hintText,
      labelText: labelText,
      autovalidateMode: autoValidateMode,
      readOnly: readOnly,
    );
  }
}
