import 'package:flip_coin/app/core/custom/app_button.dart';
import 'package:flip_coin/app/core/custom/app_text_field.dart';
import 'package:flip_coin/app/core/custom/text.dart';
import 'package:flip_coin/app/core/extensions/context_extension.dart';
import 'package:flip_coin/app/core/extensions/string_extensions.dart';
import 'package:flip_coin/app/core/theme/app_palette.dart';
import 'package:flip_coin/app/features/bottom_navigation/dashboard.dart';
import 'package:flip_coin/app/routes/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RegisterBody extends StatefulWidget {
  const RegisterBody({super.key});

  @override
  State<RegisterBody> createState() => _RegisterBodyState();
}

class _RegisterBodyState extends State<RegisterBody> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    phoneController.text = "9988773235";
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 380,
        width: width,
        decoration:  BoxDecoration(
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
          color:AppPaletteLight.background,
          boxShadow: boxShadow(color: AppPaletteLight.primary,blurRadius: 25,spreadRadius: 1.5),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                texts.completeProfile,
                style: context.themeData.textTheme.headlineMedium,
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
               texts.nameEmail,
                style: context.themeData.textTheme.bodySmall,
              ),
              const SizedBox(
                height: 24,
              ),
              AppTextField(
                controller: phoneController,
                hintText: "Enter your phone number",
                labelText: "Phone Number",
                readOnly: true,
                keyboardType: TextInputType.name,
                onChanged: (String value) {},
              ),
              const SizedBox(
                height: 24,
              ),
              AppTextField(
                controller: nameController,
                hintText: "Enter your name",
                labelText: "Name",
                inputFormatters: [
                  LengthLimitingTextInputFormatter(30),
                ],
                keyboardType: TextInputType.name,
                onChanged: (String value) {},
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      value.isValidName.isEmpty) {
                    return 'Please enter valid name';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 24,
              ),
              AppTextField(
                controller: emailController,
                hintText: "Enter your Email",
                labelText: "Name",
                inputFormatters: [
                  LengthLimitingTextInputFormatter(30),
                ],
                keyboardType: TextInputType.emailAddress,
                onChanged: (String value) {},
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      value.isValidName.isEmpty) {
                    return 'Please enter valid email';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 24,
              ),
              submitDetails(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget submitDetails(BuildContext context) {
    return AppButton(
      radius: 20,
      isLoading: false,
      onPressed: () {
        navigateRemoveUntil(context: context, to: const Dashboard());
      },
      title: texts.saveProceed,
    );
  }
}
