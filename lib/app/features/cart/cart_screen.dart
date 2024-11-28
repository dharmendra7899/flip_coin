import 'package:flip_coin/app/core/custom/text.dart';
import 'package:flip_coin/app/core/extensions/context_extension.dart';
import 'package:flip_coin/app/core/theme/app_palette.dart';
import 'package:flip_coin/app/features/bottom_navigation/provider/bottom_navigation_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  final bool? isBackButton;
  final String? type;

  const CartScreen({super.key, this.isBackButton = true, this.type});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  String? selectedTab;

  @override
  void initState() {
    selectedTab = widget.type;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () async {
        if (widget.isBackButton == true) {
          return true;
        }
        Provider.of<BottomNavigationProvider>(context, listen: false)
            .onTapped(0);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
            // toolbarHeight: 0, // Hide default AppBar
            backgroundColor: AppPaletteLight.secondaryLight,
            centerTitle: true,
            title: Expanded(
              child: Text(
                texts.cart,
                textAlign: TextAlign.center,
                style: context.themeData.textTheme.labelLarge?.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  overflow: TextOverflow.ellipsis,
                  color: AppPaletteLight.background,
                ),
              ),
            )),
        body: Container( height: height,
          width: width,
          padding: const EdgeInsets.all(8),
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
          ),),
      ),
    );
  }
}
