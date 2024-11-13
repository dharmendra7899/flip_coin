import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextField extends StatelessWidget {
  final double? width;
  final double? height;
  final Widget? iconData;
  final Widget? leadingIcon;
  final String? labelText;
  final TextStyle? labelStyle;
  final TextStyle? style;
  final bool readOnly;
  final Color? borderColor;
  final TextEditingController controller;
  final Function()? onTap;
  final String? hintText;
  final void Function(String)? onChanged;
  final void Function(String)? isValid;
  final String? Function(String?)? validator;
  final String? initialValue;
  final bool obscureText;
  final FocusNode? focusNode;
  final int? maxLines;
  final String? counterText;
  final double? fontSize;
  final Widget? prefixIcon;
  final TextCapitalization textCapitalization;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final bool? enabled;
  final void Function(String)? onFieldSubmitted;
  final EdgeInsetsGeometry contentPadding;
  final String obscuringCharacter;
  final TextAlign textAlign;
  final String? prefixText;
  final TextStyle? hintStyle;
  final Color? bgColor;
  final Color? textColor;
  final AutovalidateMode? autovalidateMode;
  final Widget? suffixIcon;
  final int? maxLength;

  const AppTextField(
      {super.key,
        this.labelText,
        this.width = 1,
        this.iconData,
        this.maxLength,
        required this.controller,
        this.onTap,
        this.readOnly = false,
        this.height,
        this.hintText,
        this.isValid(String val)?,
        this.onChanged(String val)?,
        this.hintStyle,
        this.bgColor,
        this.prefixIcon,
        this.leadingIcon,
        this.initialValue,
        this.style = const TextStyle(),
        this.fontSize = 14,
        this.obscureText = false,
        this.focusNode,
        this.keyboardType = TextInputType.text,
        this.enabled = true,
        this.textAlign = TextAlign.start,
        this.textCapitalization = TextCapitalization.none,
        this.inputFormatters,
        this.onFieldSubmitted,
        this.maxLines,
        this.borderColor,
        this.labelStyle,
        this.prefixText,
        this.counterText,
        this.obscuringCharacter = '•',
        this.contentPadding =
        const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
        this.textColor,
        this.autovalidateMode,
        this.suffixIcon,
        this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onFieldSubmitted: onFieldSubmitted,
      initialValue: initialValue,
      onChanged: onChanged,
      readOnly: readOnly,
      obscureText: obscureText,
      onTap: onTap,
      focusNode: focusNode,
      textCapitalization: textCapitalization,
      textAlign: textAlign,
      keyboardType: keyboardType,
      controller: controller,
      autovalidateMode: autovalidateMode,
      inputFormatters: inputFormatters,
      maxLines: maxLines,
      enableSuggestions: true,
      obscuringCharacter: obscuringCharacter,
      validator: validator,
      maxLength: maxLength,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        counterText: counterText,
        prefix: leadingIcon,
        suffixIcon: suffixIcon,
        hintText: hintText,
        labelText: labelText,
        filled: readOnly,
        contentPadding: contentPadding,
        alignLabelWithHint: true,
      ),
    );
  }
}
