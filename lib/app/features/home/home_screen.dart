import 'package:flip_coin/app/core/custom/message.dart';
import 'package:flip_coin/app/core/custom/show_toast.dart';
import 'package:flip_coin/app/core/theme/app_palette.dart';
import 'package:flip_coin/app/features/home/widgets/category_widget.dart';
import 'package:flip_coin/app/features/home/widgets/home_banner.dart';
import 'package:flip_coin/app/features/home/widgets/product_widgets.dart';
import 'package:flip_coin/app/features/home/widgets/search_bar_header.dart';
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
    print("called");
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
                  CustomSlider(),
                  SizedBox(
                    height: 20,
                  ),
                  CategoryWidget(),
                  SizedBox(
                    height: 20,
                  ),
                  ProductList(
                    sectionTitle: 'Welcome Offer',
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  CustomSlider(
                    height: 80,
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
                    sectionTitle: 'New Picks For You',
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  CustomSlider(
                    height: 120,
                  ),
                  SizedBox(
                    height: 80,
                  ),
                ],
              ),
            )
          ],
        ),
      ),

      /*Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: AppPaletteLight.secondaryLight,
            title: Row(
              children: [
                Container(
                  height: 40,
                  width: 40,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppPaletteLight.gray,
                  ),
                  child: Image.asset(
                    ConstantImage.account1,
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(width: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "New home ",
                          style: context.themeData.textTheme.labelLarge
                              ?.copyWith(
                                  color: AppPaletteLight.background,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18),
                        ),
                        Text(
                          '560102 ',
                          maxLines: 2,
                          style: context.themeData.textTheme.labelLarge
                              ?.copyWith(
                                  color: AppPaletteLight.background,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                        ),
                      ],
                    ),
                    const Icon(
                      Icons.keyboard_arrow_down,
                      size: 25,
                      color: AppPaletteLight.background,
                    )
                  ],
                )
              ],
            ),
            actions: [
              IconButton(
                icon: const Icon(
                  Icons.notifications_none,
                  color: AppPaletteLight.background,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(
                  Icons.shopping_cart_outlined,
                  color: AppPaletteLight.background,
                ),
                onPressed: () {},
              ),
            ],
          ),
          body: Container(
            height: height,
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
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 50,
                    width: width,
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 12),
                    margin: const EdgeInsets.only(left: 4, right: 4),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.withOpacity(0.5)),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12)),
                    child: Row(
                      children: [
                        Icon(
                          Icons.search,
                          size: 25,
                          color: Theme.of(context).primaryColor,
                        ),
                        const SizedBox(width: 15),
                        Text(
                          'Search Everything Locally...',
                          style:
                              TextStyle(color: Colors.black.withOpacity(0.5)),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  const CustomBanner(),
                  const SizedBox(
                    height: 20,
                  ),
                  const CategoryWidget(),
                  const SizedBox(
                    height: 20,
                  ),
                   ProductList(sectionTitle: 'Welcome Offer',),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomBanner(height: 80,),
                  const SizedBox(
                    height: 20,
                  ),
                  ProductList(sectionTitle: 'Monthly Big Saver',),
                  const SizedBox(
                    height: 20,
                  ),
                  ProductList(sectionTitle: 'New Picks For You',),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomBanner(height: 120,),
                  const SizedBox(
                    height: 80,
                  ),
                ],
              ),
            ),
          )),*/
    );
  }
}
