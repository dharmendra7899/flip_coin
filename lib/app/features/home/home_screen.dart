import 'package:flip_coin/app/core/assets/constant_images.dart';
import 'package:flip_coin/app/core/custom/message.dart';
import 'package:flip_coin/app/core/custom/show_toast.dart';
import 'package:flip_coin/app/core/custom/text.dart';
import 'package:flip_coin/app/core/extensions/context_extension.dart';
import 'package:flip_coin/app/core/theme/app_palette.dart';
import 'package:flip_coin/app/features/home/widgets/category_widget.dart';
import 'package:flip_coin/app/features/home/widgets/product_widgets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime? currentBackPressTime;

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > const Duration(seconds: 2)) {
      currentBackPressTime = now;
      showToast(Messages.DOUBLE_TAP, color: AppPaletteLight.primary, time: 2);
      return Future.value(false);
    }
    return Future.value(true);
  }



  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: onWillPop,
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 0, // Hide default AppBar
            backgroundColor: AppPaletteLight.primary,
          ),
          body: body(),
        ));
  }

  Widget body() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Delivery Section
          Container(
            decoration: const BoxDecoration(
                color: AppPaletteLight.primary,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          texts.delivered,
                          textAlign: TextAlign.start,
                          style:
                              context.themeData.textTheme.labelLarge?.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: AppPaletteLight.background,
                          ),
                        ),
                        Text(
                          '9 minutes',
                          textAlign: TextAlign.start,
                          style:
                              context.themeData.textTheme.labelLarge?.copyWith(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: AppPaletteLight.background,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          color: AppPaletteLight.background,
                          borderRadius: BorderRadius.circular(30)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Image.asset(
                          ConstantImage.profile,
                        ),
                      ),
                    )
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        'Phase 2, Sector 62, Industrial Area',
                        textAlign: TextAlign.start,
                        style: context.themeData.textTheme.bodyMedium?.copyWith(
                          fontSize: 16,
                          overflow: TextOverflow.ellipsis,
                          color: AppPaletteLight.background,
                        ),
                      ),
                    ),
                    Text(
                      texts.change,
                      textAlign: TextAlign.center,
                      style: context.themeData.textTheme.bodyLarge?.copyWith(
                          fontSize: 14,
                          overflow: TextOverflow.ellipsis,
                          color: AppPaletteLight.background,
                          decoration: TextDecoration.underline),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                // Search Bar
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Row(
                    children: [
                      SizedBox(width: 12),
                      Icon(
                        Icons.search,
                        color: AppPaletteLight.gray,
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Search here...',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      Icon(Icons.mic, color: Colors.grey),
                      SizedBox(width: 12),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 12,
                )
              ],
            ),
          ),
          // Categories Section
          const CategoryWidget(),
          const ProductWidgets(),
          // Bestsellers Section

        ],
      ),
    );
  }



}
