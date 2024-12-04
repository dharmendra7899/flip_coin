import 'package:flip_coin/app/core/custom/message.dart';
import 'package:flip_coin/app/core/custom/show_toast.dart';
import 'package:flip_coin/app/core/theme/app_palette.dart';
import 'package:flip_coin/app/features/home/presentation/widgets/brand_widget.dart';
import 'package:flip_coin/app/features/home/presentation/widgets/deal_widget.dart';
import 'package:flip_coin/app/features/home/presentation/widgets/home_banner.dart';
import 'package:flip_coin/app/features/home/presentation/widgets/kadak_widget.dart';
import 'package:flip_coin/app/features/home/presentation/widgets/product_widgets.dart';
import 'package:flip_coin/app/features/home/presentation/widgets/search_bar_header.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime? currentBackPressTime;
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();
  final ScrollController _scrollBottomBarController = ScrollController();

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

  Future<void> _refresh() async {
    debugPrint("called");
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: onWillPop,
      child: RefreshIndicator(
        color: AppPaletteLight.primary,
        key: _refreshIndicatorKey,
        onRefresh: _refresh,
        child: Container(
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
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            controller: _scrollBottomBarController,
            slivers: [
              SliverPersistentHeader(
                floating: true,
                pinned: false,
                delegate: SearchBarHeaderDelegate(),
              ),
              const SliverToBoxAdapter(
                child: Column(
                  children: [
                    SizedBox(
                      height: 8,
                    ),
                    KadakWidget(
                      title: 'Kadake ki BACHAT',
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomSlider(height: 160,),
                    SizedBox(
                      height: 20,
                    ),
                    BrandWidget(),
                    SizedBox(
                      height: 20,
                    ),

                    ProductList(
                      sectionTitle: 'Welcome Offer',
                      isTitle: true,
                      color2: AppPaletteLight.gradient11,
                      color1: AppPaletteLight.secondary1,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomSlider(height: 50,),
                    SizedBox(
                      height: 10,
                    ),
                    DealWidget(
                      title: 'NEVER BEFORE DEALS',
                    ),


                    SizedBox(
                      height: 20,
                    ),
                    ProductList(
                      sectionTitle: 'Monthly Big Saver',
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ProductList(
                      sectionTitle: 'New Picks Fr you',
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    CustomSlider(
                      height: 120,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
