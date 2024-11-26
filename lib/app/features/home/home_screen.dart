import 'package:flip_coin/app/core/assets/constant_images.dart';
import 'package:flip_coin/app/core/custom/message.dart';
import 'package:flip_coin/app/core/custom/show_toast.dart';
import 'package:flip_coin/app/core/custom/text.dart';
import 'package:flip_coin/app/core/extensions/context_extension.dart';
import 'package:flip_coin/app/core/theme/app_palette.dart';
import 'package:flip_coin/app/features/home/widgets/category_widget.dart';
import 'package:flip_coin/app/features/home/widgets/home_banner.dart';
import 'package:flip_coin/app/features/home/widgets/product_widgets.dart';
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
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: AppPaletteLight.primary,
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
                Expanded(
                  child: Text(
                    '560102 - New home ',
                    maxLines: 2,
                    style: context.themeData.textTheme.labelLarge?.copyWith(
                        color: AppPaletteLight.background,
                        fontWeight: FontWeight.w500,
                        fontSize: 16),
                  ),
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
            padding: const EdgeInsets.all(12),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    AppPaletteLight.primary,
                    AppPaletteLight.secondaryDark,
                    AppPaletteLight.secondary,
                    AppPaletteLight.background,
                  ],
                  begin: FractionalOffset.topCenter,
                  end: FractionalOffset.bottomCenter,
                  tileMode: TileMode.repeated),
            ),
            child: const SingleChildScrollView(
              child: Column(
                children: [
                  HomeBanner(),
                  CategoryWidget()
                ],
              ),
            ),
          )),
    );
  }

/*  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: onWillPop,
        child: Scaffold(

          body: SafeArea(
            child: NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  SliverAppBar(
                    backgroundColor:AppPaletteLight.primary,
                     expandedHeight: 160.0,
                    // collapsedHeight: 70,
                    floating: false,
                    pinned: true,
                    flexibleSpace: FlexibleSpaceBar(
                        centerTitle: true,
                        title: Container(
                          height: 35,
                          margin: const EdgeInsets.symmetric(horizontal: 12),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(6),
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
                        background:  Container(
                          decoration: const BoxDecoration(
                              color: AppPaletteLight.primary,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20))),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12.0),
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
                                const SizedBox(
                                  height: 8,
                                )
                              ],
                            ),
                          ),
                        )),
                  ),
                ];
              },
              body: body(),
            ),
          ),
        ));
  }*/
/*
  Widget body() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Categories Section
          CategoryWidget(),
          ProductWidgets(),
          // Bestsellers Section
        ],
      ),
    );
  }*/
}
