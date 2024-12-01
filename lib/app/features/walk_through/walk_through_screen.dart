import 'package:flip_coin/app/core/assets/constant_images.dart';
import 'package:flip_coin/app/core/extensions/context_extension.dart';
import 'package:flip_coin/app/core/helper_function/helper_function.dart';
import 'package:flip_coin/app/core/theme/app_palette.dart';
import 'package:flip_coin/app/features/bottom_navigation/dashboard.dart';
import 'package:flip_coin/app/routes/navigation.dart';
import 'package:flip_coin/config/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Walkthrough extends StatefulWidget {
  const Walkthrough({super.key});

  @override
  State<Walkthrough> createState() => _WalkthroughState();
}

class _WalkthroughState extends State<Walkthrough> {
  PageController pageController = PageController();
  int currentPage = 0;
  late List<Map<String, String>> onBoardingData = [];

  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration.zero,
      () {
        setState(
          () {
            onBoardingData = [
              {
                'image': 'introimage_a',
                'title': strings.intro1,
                'description': strings.introDescription1,
              },
              {
                'image': 'introimage_b',
                'title': strings.intro2,
                'description': strings.introDescription2,
              },
              {
                'image': 'introimage_c',
                'title': strings.intro3,
                'description': strings.introDescription3,
              },
            ];
          },
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

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
                  SizedBox(
                    height: 400,
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: SvgPicture.asset(
                      fit: BoxFit.fitWidth,
                      DesignConfiguration.setSvgPath(
                        onBoardingData[index]['image']!,
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                  Text(
                    onBoardingData[index]['title']!,
                    textAlign: TextAlign.center,
                    style: context.themeData.textTheme.labelLarge!
                        .copyWith(fontWeight: FontWeight.w600, fontSize: 25),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30.0, vertical: 8),
                    child: Text(
                      textAlign: TextAlign.center,
                      onBoardingData[index]['description']!,
                      style: context.themeData.textTheme.labelMedium
                          ?.copyWith(fontWeight: FontWeight.w500, fontSize: 20),
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
                            context: context, to: const Dashboard());
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
