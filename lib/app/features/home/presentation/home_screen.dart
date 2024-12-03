import 'package:flip_coin/app/core/custom/message.dart';
import 'package:flip_coin/app/core/custom/show_toast.dart';
import 'package:flip_coin/app/core/theme/app_palette.dart';
import 'package:flip_coin/app/features/home/presentation/widgets/brand_widget.dart';
import 'package:flip_coin/app/features/home/presentation/widgets/home_banner.dart';
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
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    const SizedBox(height: 8,),
                    const CustomSlider(),
                    const SizedBox(
                      height: 20,
                    ),
                    const BrandWidget(),
                    const SizedBox(
                      height: 20,
                    ),
                    const ProductList(
                      sectionTitle: 'Welcome Offer',
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const CustomSlider(
                      height: 80,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const ProductList(
                      sectionTitle: 'Monthly Big Saver',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const ProductList(
                      sectionTitle: 'New Picks For You',
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const CustomSlider(
                      height: 120,
                    ),

                    const SizedBox(
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
