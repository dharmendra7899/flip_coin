import 'package:flip_coin/app/core/assets/constant_images.dart';
import 'package:flip_coin/app/core/custom/app_button.dart';
import 'package:flip_coin/app/core/custom/text.dart';
import 'package:flip_coin/app/core/extensions/context_extension.dart';
import 'package:flip_coin/app/core/theme/app_palette.dart';
import 'package:flip_coin/app/features/bottom_navigation/provider/bottom_navigation_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({
    super.key,
  });

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  final List<Map<String, String>> accountList = [
    {"name": texts.address},
    {"name": texts.wishlist},
    {"name": texts.orders},
    {"name": texts.referEarn},
    {"name": texts.help},
    {"name": texts.notification},
    {"name": texts.privacy},
    {"name": texts.termCondition},
    {"name": texts.faq},
    {"name": texts.logout},
    // {"name": texts.deleteAccount},
  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      height: height,
      width: width,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            colors: [
              AppPaletteLight.secondaryLight,
              AppPaletteLight.background,
              AppPaletteLight.background,
              AppPaletteLight.background,
            ],
            begin: FractionalOffset.topCenter,
            end: FractionalOffset.bottomCenter,
            tileMode: TileMode.repeated),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _profileContainer(),
              const SizedBox(
                height: 10,
              ),
              ListView.separated(
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: accountList.length,
                separatorBuilder: (context, index) {
                  return const Divider(
                    color: AppPaletteLight.onSurfaceVariant,
                    height: 1,
                    thickness: 0.7,
                  );
                },
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {},
                    child: SizedBox(
                      height: 50,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              accountList[index]['name'] ?? '',
                              style: context.themeData.textTheme.labelLarge
                                  ?.copyWith(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const Icon(
                              Icons.arrow_forward_ios,
                              size: 15,
                              color: AppPaletteLight.black,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
              const Divider(
                color: AppPaletteLight.onSurfaceVariant,
                height: 1,
                thickness: 0.7,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _profileContainer() {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        border: Border.all(width: 0.4, color: AppPaletteLight.gray),
        boxShadow: boxShadow(),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 80,
                width: 80,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                ),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: Image.asset(ConstantImage.profile)),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Dharmendra Kumar',
                      textAlign: TextAlign.start,
                      style: context.themeData.textTheme.labelLarge?.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      '9795541088',
                      textAlign: TextAlign.start,
                      style: context.themeData.textTheme.labelLarge?.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      'flip@gmail.com',
                      textAlign: TextAlign.start,
                      style: context.themeData.textTheme.labelLarge?.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(height: 3),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
