import 'package:flip_coin/app/core/assets/constant_images.dart';
import 'package:flip_coin/app/core/extensions/context_extension.dart';
import 'package:flip_coin/app/core/theme/app_palette.dart';
import 'package:flip_coin/app/features/bottom_navigation/dashboard.dart';
import 'package:flip_coin/app/routes/navigation.dart';
import 'package:flip_coin/config/strings.dart';
import 'package:flutter/material.dart';

class Walkthrough extends StatefulWidget {
  const Walkthrough({super.key});

  @override
  State<Walkthrough> createState() => _WalkthroughState();
}

class _WalkthroughState extends State<Walkthrough> {
  PageController pageController = PageController();
  int currentPage = 0;

  List<Map<String, String>> onBoardingData = [
    {
      'image': ConstantImage.appLogo,
      'title': strings.appName,
      'description': strings.appName,
    },
    {
      'image': ConstantImage.appLogo,
      'title': strings.appName,
      'description': strings.appName,
    },
    {
      'image': ConstantImage.appLogo,
      'title': strings.appName,
      'description': strings.appName,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPaletteLight.background,
      body: Stack(
        children: [
          PageView.builder(
            itemCount: onBoardingData.length,
            scrollDirection: Axis.horizontal,
            controller: pageController,
            onPageChanged: onChanged,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    onBoardingData[index]['title']!,
                    style: context.themeData.textTheme.labelLarge,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ClipRRect(
                      borderRadius: BorderRadius.circular(200),
                      child: Image.asset(
                        onBoardingData[index]['image']!,
                        scale: 5,
                      )),
                  const SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 8),
                    child: Text(
                      onBoardingData[index]['description']!,
                      style: context.themeData.textTheme.labelMedium
                          ?.copyWith(fontWeight: FontWeight.w400),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              );
            },
          ),
          Positioned(
            bottom: 20.0,
            left: 20.0,
            right: 20.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 42,
                  height: 42,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    onBoardingData.length,
                    (index) => buildIndicator(index),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (currentPage != onBoardingData.length - 1) {
                      pageController.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.ease,
                      );
                    } else {
                      if (context.mounted) {
                        navigateRemoveUntil(
                            context: context,
                            to: const Dashboard());
                      }
                    }
                  },
                  child: Container(
                    width: 42,
                    height: 42,
                    decoration: BoxDecoration(
                        color: AppPaletteLight.primary,
                        borderRadius: BorderRadius.circular(50)),
                    child: Center(
                      child: Icon(
                        currentPage != onBoardingData.length - 1
                            ? Icons.arrow_forward
                            : Icons.done,
                        color: AppPaletteLight.background,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void onChanged(int index) {
    setState(() {
      currentPage = index;
    });
  }

  Widget buildIndicator(int index) {
    return Container(
      width: 10.0,
      height: 10.0,
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: currentPage == index
            ? AppPaletteLight.primary
            : AppPaletteLight.gray,
      ),
    );
  }
}
