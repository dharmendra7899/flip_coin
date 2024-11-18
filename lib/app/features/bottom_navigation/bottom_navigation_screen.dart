import 'package:flip_coin/app/core/assets/constant_images.dart';
import 'package:flip_coin/app/core/custom/no_internet.dart';
import 'package:flip_coin/app/core/custom/text.dart';
import 'package:flip_coin/app/core/custom/validate_connectivity.dart';
import 'package:flip_coin/app/core/custom_providers/internet_provider.dart';
import 'package:flip_coin/app/core/theme/app_palette.dart';
import 'package:flip_coin/app/features/account/account_screen.dart';
import 'package:flip_coin/app/features/bottom_navigation/bottom_navigation_provider.dart';
import 'package:flip_coin/app/features/cart/cart_screen.dart';
import 'package:flip_coin/app/features/category/category_screen.dart';
import 'package:flip_coin/app/features/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  late final List<Widget> screens;

  @override
  void initState() {
    super.initState();
    screens = [
      HomeScreen(),
      CategoryScreen(isBackButton: false),
      CartScreen(isBackButton: false),
      AccountScreen(isBackButton: false),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavigationProvider>(
      builder: (context, provider, child) {
        return Consumer<CheckInternet>(
          builder: (context, internet, child) {
            validateConnectivity(
              context: context,
              provider: () {},
              showMessage: false,
            );
            return Scaffold(
              extendBody: true,
              bottomNavigationBar: Theme(
                data: ThemeData(
                  useMaterial3: false,
                ),
                child: Material(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.transparent,
                  // elevation: 10,
                  child: BottomNavigationBar(
                    showUnselectedLabels: true,
                    elevation: 2,
                    showSelectedLabels: true,
                    type: BottomNavigationBarType.fixed,
                    // backgroundColor: AppPaletteLight.secondary,
                    currentIndex: provider.index,
                    items: _bottomNavigationBarItem(),
                    selectedItemColor: AppPaletteLight.primary,
                    unselectedItemColor: AppPaletteLight.gray,
                    selectedLabelStyle: const TextStyle(
                      color: AppPaletteLight.primary,
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      fontFamily: 'Poppins',
                    ),
                    unselectedLabelStyle: const TextStyle(
                      color: AppPaletteLight.gray,
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      fontFamily: 'Poppins',
                    ),
                    onTap: provider.onTapped,
                    selectedFontSize: 10,
                    unselectedFontSize: 10,
                    iconSize: 22,
                  ),
                ),
              ),
              body: internet.isConnected
                  ? screens[provider.index]
                  : const NoInternetPage(),
            );
          },
        );
      },
    );
  }

  List<BottomNavigationBarItem> _bottomNavigationBarItem() {
    return [
      BottomNavigationBarItem(
        activeIcon: Image.asset(
          ConstantImage.home1,
          height: 25,
          width: 25,
          fit: BoxFit.contain,
          color: AppPaletteLight.primary,
        ),
        icon: Image.asset(
          ConstantImage.home,
          height: 25,
          width: 25,
          fit: BoxFit.contain,
        ),
        label: texts.home,
      ),
      BottomNavigationBarItem(
        activeIcon: Image.asset(
          ConstantImage.category1,
          height: 25,
          width: 25,
          color: AppPaletteLight.primary,
          fit: BoxFit.contain,
        ),
        icon: Image.asset(
          ConstantImage.category,
          height: 25,
          width: 25,
          fit: BoxFit.contain,
        ),
        label: texts.category,
      ),
      BottomNavigationBarItem(
        activeIcon: Image.asset(
          ConstantImage.cart1,
          height: 25,
          width: 25,
          color: AppPaletteLight.primary,
          fit: BoxFit.contain,
        ),
        icon: Image.asset(
          ConstantImage.cart,
          height: 25,
          width: 25,
          fit: BoxFit.contain,
        ),
        label: texts.cart,
      ),
      BottomNavigationBarItem(
          activeIcon: Image.asset(
            ConstantImage.account1,
            height: 25,
            width: 25,
            color: AppPaletteLight.primary,
            fit: BoxFit.contain,
          ),
          icon: Image.asset(
            ConstantImage.account,
            height: 25,
            width: 25,
            fit: BoxFit.contain,
          ),
          label: texts.account),
    ];
  }
}
