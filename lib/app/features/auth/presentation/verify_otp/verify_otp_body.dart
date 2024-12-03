import 'package:flip_coin/app/core/custom/app_button.dart';
import 'package:flip_coin/app/core/extensions/context_extension.dart';
import 'package:flip_coin/app/core/theme/app_palette.dart';
import 'package:flip_coin/app/features/auth/presentation/register/register_page.dart';
import 'package:flip_coin/app/features/auth/presentation/widgets/terms_and_condition_widget.dart';
import 'package:flip_coin/app/routes/navigation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OTPVerificationBody extends StatelessWidget {
  OTPVerificationBody({super.key});

  final TextEditingController otpController = TextEditingController();
  final loginMobileFormKey = GlobalKey<FormState>();

  int remainingTime = 0;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 340,
        width: width,
        decoration:  BoxDecoration(
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
          color:AppPaletteLight.background,
          boxShadow: boxShadow(color: AppPaletteLight.primary,blurRadius: 25,spreadRadius: 1.5),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Verify OTP",
                  style: context.themeData.textTheme.headlineMedium,
                ),
                const SizedBox(
                  height: 4,
                ),
                Row(
                  children: [
                    Text(
                      "We have sent an OTP to +91 9988776655",
                      style: context.themeData.textTheme.bodySmall,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: const Icon(
                        Icons.edit,
                        size: 16,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                pinCodeField(context),
                const SizedBox(
                  height: 14,
                ),
                resendOTP(context),
                const SizedBox(
                  height: 24,
                ),
                verifyOTPButton(context),
                const SizedBox(
                  height: 12,
                ),
                const TermsAndConditionWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget pinCodeField(BuildContext context) {
    return Form(
      key: loginMobileFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 45.0),
        child: PinCodeTextField(
          appContext: context,
          length: 6,
          obscureText: true,
          obscuringCharacter: '*',
          keyboardType: TextInputType.number,
          showCursor: true,
          animationType: AnimationType.slide,
          enableActiveFill: true,
          pinTheme: PinTheme(
            fieldHeight: 40, // Adjust the field height
            fieldWidth: 40,  // Adjust the field width
            shape: PinCodeFieldShape.box,
            borderWidth: 0.8,
            selectedColor: AppPaletteLight.lightBlack,
            activeFillColor: AppPaletteLight.background,
            inactiveFillColor: AppPaletteLight.background,
            selectedFillColor: AppPaletteLight.background,
            borderRadius: BorderRadius.circular(8),
          ),
          textStyle: context.themeData.textTheme.headlineMedium,
          boxShadows: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 4.0,
            ),
          ],
          onChanged: (String value) {},
        ),
      ),

    );
  }

  Widget resendOTP(BuildContext context) {
    return Row(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            if (remainingTime > 0)
              Text(
                "Resend OTP in $remainingTime seconds",
                style: context.themeData.textTheme.bodySmall,
              )
            else
              RichText(
                text: TextSpan(
                  text: "Resend OTP",
                  style: context.themeData.textTheme.bodySmall
                      ?.copyWith(decoration: TextDecoration.underline),
                  recognizer: TapGestureRecognizer()..onTap = () {},
                ),
              )
          ],
        )
      ],
    );
  }

  Widget verifyOTPButton(BuildContext context) {
    return AppButton(
      radius: 20,
      isLoading: false,
      onPressed: () {
        navigateTo(context: context, to: const RegisterPage());
      },
      title: "Submit",
    );
  }
}
