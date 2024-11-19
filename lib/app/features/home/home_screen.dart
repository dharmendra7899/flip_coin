import 'package:flip_coin/app/core/assets/constant_images.dart';
import 'package:flip_coin/app/core/custom/message.dart';
import 'package:flip_coin/app/core/custom/show_toast.dart';
import 'package:flip_coin/app/core/custom/text.dart';
import 'package:flip_coin/app/core/extensions/context_extension.dart';
import 'package:flip_coin/app/core/theme/app_palette.dart';
import 'package:flip_coin/app/features/home/widgets/category_widget.dart';
import 'package:flip_coin/app/features/home/widgets/product_widgets.dart';
import 'package:flip_coin/app/features/home/widgets/banner_slider.dart';
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
          appBar: AppBar(title: Text("201001"),
            actions: [
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.notifications),
                onPressed: () {},
              ),
            ],
          ),
          body: body(),
        ));
  }

  Widget body() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BannerSlider(),
          CategoryGrid(),
          ProductList(sectionTitle: "Welcome Offers"),
          ProductList(sectionTitle: "Never Before Deals"),
          ProductList(sectionTitle: "Monthly Big Saver"),
          ProductList(sectionTitle: "Shop by Offers"),
          ProductList(sectionTitle: "New Picks For You"),
        ],
      ),
    );
  }


}
