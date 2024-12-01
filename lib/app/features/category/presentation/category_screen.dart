import 'package:flip_coin/app/core/custom/text.dart';
import 'package:flip_coin/app/core/theme/app_palette.dart';
import 'package:flip_coin/app/features/bottom_navigation/provider/bottom_navigation_provider.dart';
import 'package:flip_coin/app/features/category/presentation/widget/category_widget.dart';
import 'package:flip_coin/app/features/home/presentation/widgets/search_bar_header.dart';
import 'package:flip_coin/app/features/home/presentation/widgets/shop_by_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryScreen extends StatefulWidget {

  const CategoryScreen({super.key,});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {


  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();
  final ScrollController _scrollBottomBarController = ScrollController();



  Future<void> _refresh() async {
    debugPrint("called");
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return RefreshIndicator(
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
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      CategoryWidget(
                        title: texts.grocery,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CategoryWidget(
                        title: texts.snacks,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CategoryWidget(
                        title: texts.beauty,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CategoryWidget(
                        title: texts.house,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ShopByStore(
                        title: texts.shopByStore,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
