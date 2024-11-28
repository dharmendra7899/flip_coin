import 'package:flip_coin/app/core/custom_providers/internet_provider.dart';
import 'package:flip_coin/app/features/auth/auth_provider.dart';
import 'package:flip_coin/app/features/bottom_navigation/provider/bottom_navigation_provider.dart';
import 'package:flip_coin/app/features/category/provider/category_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomProvider extends StatelessWidget {
  final Widget child;
  final AuthProvider? loginState;

  const CustomProvider({super.key, required this.child, this.loginState});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CheckInternet(),
        ),
        ChangeNotifierProvider(
          create: (context) => BottomNavigationProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => loginState,
        ),
        ChangeNotifierProvider(
          create: (context) => CategoryProvider(),
        ),
      ],
      child: child,
    );
  }
}
