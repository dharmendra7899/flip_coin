import 'package:flip_coin/app/core/custom/app_button.dart';
import 'package:flip_coin/app/core/custom/text.dart';
import 'package:flip_coin/app/core/extensions/context_extension.dart';
import 'package:flip_coin/app/core/theme/app_palette.dart';
import 'package:flip_coin/app/features/auth/presentation/verify_otp/verify_otp_page.dart';
import 'package:flip_coin/app/features/auth/presentation/widgets/login_text_field.dart';
import 'package:flip_coin/app/features/auth/presentation/widgets/send_feedback.dart';
import 'package:flip_coin/app/features/auth/presentation/widgets/terms_and_condition_widget.dart';
import 'package:flip_coin/app/routes/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginMobileBody extends StatelessWidget {
  LoginMobileBody({super.key});

  final loginMobileFormKey = GlobalKey<FormState>();
  final TextEditingController mobileController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 340,
            width: width,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
              color: AppPaletteLight.background,
              boxShadow: boxShadow(
                  color: AppPaletteLight.primary,
                  blurRadius: 25,
                  spreadRadius: 1.5),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Login/Create",
                    style: context.themeData.textTheme.headlineMedium,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    "Enter phone number to proceed",
                    style: context.themeData.textTheme.bodySmall,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Form(
                    key: loginMobileFormKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: LoginTextField(
                      controller: mobileController,
                      hintText: "10 digit phone number",
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(10),
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      onChanged: (value) {},
                      keyboardType: TextInputType.number,
                      prefixIcon: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "+91",
                            style: context.textTheme.bodyLarge,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  getOTPButton(context),
                  const SizedBox(
                    height: 12,
                  ),
                  const TermsAndConditionWidget(),
                  const SizedBox(
                    height: 12,
                  ),
                  Divider(
                    color: context.colorScheme.primary,
                    thickness: 1,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const SendFeedback()
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget getOTPButton(BuildContext context) {
    return AppButton(
      radius: 20,
      isLoading: false,
      onPressed: () {
        navigateTo(context: context, to: const VerifyOTPPage());
      },
      title: texts.getOTP,
    );
  }
}
