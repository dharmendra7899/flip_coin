import 'package:flip_coin/app/core/extensions/context_extension.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TermsAndConditionWidget extends StatelessWidget {
  const TermsAndConditionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: context.themeData.textTheme.labelSmall,
        children: [
          const TextSpan(
            text: 'By continuing, you agree to our ',
            style: TextStyle(color: Colors.black),
          ),
          TextSpan(
            text: 'Terms & Conditions ',
            style: const TextStyle(fontWeight: FontWeight.w600),
            recognizer: TapGestureRecognizer()
              ..onTap = () {

              },
          ),
          const TextSpan(
            text: 'and ',
          ),
          TextSpan(
            text: 'Privacy Policy',
            style: const TextStyle(fontWeight: FontWeight.w600),
            recognizer: TapGestureRecognizer()
              ..onTap = () {

              },
          )
        ],
      ),
    );
  }
}
