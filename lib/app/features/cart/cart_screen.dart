import 'package:flip_coin/app/core/custom/text.dart';
import 'package:flip_coin/app/core/extensions/context_extension.dart';
import 'package:flip_coin/app/core/theme/app_palette.dart';
import 'package:flip_coin/app/features/bottom_navigation/bottom_navigation_provider.dart';
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
            backgroundColor: AppPaletteLight.primary,
            centerTitle: true,
            title: Expanded(
              child: Text(
                texts.cart,
                textAlign: TextAlign.center,
                style: context.themeData.textTheme.labelLarge?.copyWith(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.ellipsis,
                  color: AppPaletteLight.background,
                ),
              ),
            )),
      ),
    );
  }
}
