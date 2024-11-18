import 'package:flip_coin/app/core/assets/constant_images.dart';
import 'package:flip_coin/app/core/custom/message.dart';
import 'package:flip_coin/app/core/custom/show_toast.dart';
import 'package:flip_coin/app/core/custom/text.dart';
import 'package:flip_coin/app/core/extensions/context_extension.dart';
import 'package:flip_coin/app/core/theme/app_palette.dart';
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

  final List<String> imageUrls = [
    ConstantImage.chicken,
    ConstantImage.mutton,
    ConstantImage.egg,
    ConstantImage.bir,
    ConstantImage.chick,
    ConstantImage.bir,
    ConstantImage.chick,
    ConstantImage.chicken,
    ConstantImage.download,
    ConstantImage.egg,
    ConstantImage.download,
    ConstantImage.egg,
    ConstantImage.download,
  ];

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
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Categories',
                  textAlign: TextAlign.center,
                  style: context.themeData.textTheme.labelMedium
                      ?.copyWith(fontSize: 20, overflow: TextOverflow.ellipsis),
                ),
                Text(
                  'Reccomened for you',
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  style: context.themeData.textTheme.labelSmall?.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppPaletteLight.gray,
                      overflow: TextOverflow.ellipsis),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 200,
                  child: GridView.count(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    physics: AlwaysScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    childAspectRatio: 1,
                    children: [
                      _buildCategoryItem('Noodles', ConstantImage.noodle),
                      _buildCategoryItem('Coffee', ConstantImage.coffee),
                      _buildCategoryItem('Biryani', ConstantImage.biryani),
                      _buildCategoryItem('Noodles', ConstantImage.noodle),
                      _buildCategoryItem('Noodles', ConstantImage.noodle),
                      _buildCategoryItem('Coffee', ConstantImage.coffee),
                      _buildCategoryItem('Cake', ConstantImage.cake),
                      _buildCategoryItem('Noodles', ConstantImage.noodle),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Bestsellers Section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Bestsellers',
                      textAlign: TextAlign.center,
                      style: context.themeData.textTheme.labelMedium?.copyWith(
                          fontSize: 20, overflow: TextOverflow.ellipsis),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        texts.seeAll,
                        textAlign: TextAlign.center,
                        style: context.themeData.textTheme.labelSmall?.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            overflow: TextOverflow.ellipsis),
                      ),
                    ),
                  ],
                ),
                GridView.count(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 4,
                  childAspectRatio: 0.7,
                  children: List.generate(imageUrls.length, (index) {
                    return _buildProductItem(imageUrls[index]);
                  }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryItem(String label, String asset) {
    return Column(
      children: [
        Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.red.shade50,
          ),
          child: Center(
              child: Image.asset(
            asset,
            height: 70,
            width: 70,
            fit: BoxFit.cover,
          )),
        ),
        SizedBox(height: 4),
        Text(
          label,
          textAlign: TextAlign.center,
          maxLines: 2,
          style: context.themeData.textTheme.bodyMedium?.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              overflow: TextOverflow.ellipsis),
        ),
      ],
    );
  }

  Widget _buildProductItem(String image) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.grey.shade200,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                image,
                fit: BoxFit.cover,
              ),
            )),
        const SizedBox(
          height: 5,
        ),
        Text(
          'Chicken Biryani',
          textAlign: TextAlign.center,
          maxLines: 2,
          style: context.themeData.textTheme.bodyMedium?.copyWith(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              overflow: TextOverflow.ellipsis),
        ),
      ],
    );
  }
}
