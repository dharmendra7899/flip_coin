import 'package:flip_coin/app/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class SendFeedback extends StatelessWidget {
  const SendFeedback({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Icon(
              Icons.mail_outline,
              size: 18,
            ),
            const SizedBox(width: 4,),
            Text(
              'Send Feedback',
              style: context.textTheme.labelSmall,
            ),
          ],
        ),
        const Icon(
          Icons.arrow_forward_ios,
          size: 12,
        )
      ],
    );
  }
}
