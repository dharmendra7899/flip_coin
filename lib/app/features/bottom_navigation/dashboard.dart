import 'dart:async';
import 'dart:io';
import 'package:flip_coin/app/core/assets/constant_images.dart';
import 'package:flip_coin/app/core/custom/text.dart';
import 'package:flip_coin/app/core/custom/validate_connectivity.dart';
import 'package:flip_coin/app/core/custom_providers/internet_provider.dart';
import 'package:flip_coin/app/core/extensions/context_extension.dart';
import 'package:flip_coin/app/core/helper_function/helper_function.dart';
import 'package:flip_coin/app/core/theme/app_palette.dart';
import 'package:flip_coin/app/features/account/account_screen.dart';
import 'package:flip_coin/app/features/bottom_navigation/provider/bottom_navigation_provider.dart';
import 'package:flip_coin/app/features/cart/cart_screen.dart';
import 'package:flip_coin/app/features/category/all_categories.dart';
import 'package:flip_coin/app/features/category/category_screen.dart';
import 'package:flip_coin/app/features/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatefulWidget {
  static GlobalKey<DashboardPageState> dashboardScreenKey =
      GlobalKey<DashboardPageState>();

  const Dashboard({super.key});

  @override
  DashboardPageState createState() => DashboardPageState();
}

class DashboardPageState extends State<Dashboard>
    with TickerProviderStateMixin, WidgetsBindingObserver {
  int selBottom = 0;
  late TabController _tabController;

  late AnimationController navigationContainerAnimationController =
      AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 200),
  );

  changeTabPosition(int index) {
    Future.delayed(Duration.zero, () {
      _tabController.animateTo(index);
    });
  }

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);

    _tabController = TabController(
      length: 4,
      vsync: this,
    );

    _tabController.addListener(
      () {
        Future.delayed(const Duration(microseconds: 10)).then(
          (value) {
            setState(
              () {
                selBottom = _tabController.index;
              },
            );
          },
        );
        //show bottombar on tab change by user interaction
        if (_tabController.index != 0 ||
            _tabController.index != 1 ||
            _tabController.index != 2 &&
                !context.read<BottomNavigationProvider>().getBars) {
          context
              .read<BottomNavigationProvider>()
              .animationController
              .reverse();
          context.read<BottomNavigationProvider>().showAppAndBottomBars(true);
        }
        // if (_tabController.index == 3) {
        //   cartTotalClear(context);
        // }
      },
    );

    Future.delayed(Duration.zero, () async {
      if (mounted) {
        context.read<BottomNavigationProvider>()
          ..setAnimationController(navigationContainerAnimationController)
          ..setBottomBarOffsetToAnimateController(
              navigationContainerAnimationController)
          ..setAppBarOffsetToAnimateController(
              navigationContainerAnimationController);
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: selBottom == 0,
      onPopInvoked: (didPop) {
        if (_tabController.index != 0) {
          _tabController.animateTo(0);
        }
      },
      child: Consumer<CheckInternet>(builder: (context, internet, child) {
        validateConnectivity(
          context: context,
          provider: () {},
          showMessage: false,
        );
        return Scaffold(
         extendBodyBehindAppBar: false,
          extendBody: true,
          backgroundColor: AppPaletteLight.background,
          appBar: selBottom == 0
              ? _getAppBar()
              : AppBar(
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.dark,
              statusBarBrightness: Brightness.light,
            ),
                  toolbarHeight: 0,
                  elevation: 0,
                  backgroundColor: AppPaletteLight.background,
                ),
          body: SafeArea(
            child: TabBarView(
              controller: _tabController,
              children: const [
                HomeScreen(),
               // CategoryScreen(isBackButton: false),
                AllCategories(),
                CartScreen(isBackButton: false),
                AccountScreen(isBackButton: false),
              ],
            ),
          ),
          bottomNavigationBar: _getBottomBar(),
        );
      }),
    );
  }

  _getAppBar() {
    final appBar = AppBar(
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      elevation: 0,
      toolbarHeight: 60,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom:
              Radius.circular(20), // Radius for bottom left and right corners
        ),
      ),
      centerTitle: false,
      automaticallyImplyLeading: false,
      backgroundColor: AppPaletteLight.background,
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
                    style: context.themeData.textTheme.labelLarge?.copyWith(
                        color: AppPaletteLight.textColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 16),
                  ),
                  Text(
                    '560102 ',
                    maxLines: 2,
                    style: context.themeData.textTheme.labelLarge?.copyWith(
                        color: AppPaletteLight.textColor,
                        fontWeight: FontWeight.w500,
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
      // title: SvgPicture.asset(
      //   DesignConfiguration.setSvgPath('titleicon_dark'),
      //   height: 40,
      // ),

      actions: [
        IconButton(
          icon: const Icon(
            Icons.notifications_none,
            color: AppPaletteLight.lightBlack,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(
            Icons.shopping_cart_outlined,
            color: AppPaletteLight.lightBlack,
          ),
          onPressed: () {},
        ),
      ],
    );

    return PreferredSize(
      preferredSize: appBar.preferredSize,
      child: SlideTransition(
        position:
            context.watch<BottomNavigationProvider>().animationAppBarBarOffset,
        child: SizedBox(
          height: context.watch<BottomNavigationProvider>().getBars ? 100 : 0,
          child: appBar,
        ),
      ),
    );
  }

  getTabItem(String enabledImage, String disabledImage, int selectedIndex,
      String name) {
    return Wrap(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: SizedBox(
                height: 25,
                child: selBottom == selectedIndex
                    ? Lottie.asset(
                        DesignConfiguration.setLottiePath(enabledImage),
                        repeat: false,
                        height: 25,
                      )
                    : SvgPicture.asset(
                        DesignConfiguration.setSvgPath(disabledImage),
                        colorFilter: const ColorFilter.mode(
                            Colors.grey, BlendMode.srcIn),
                        height: 20,
                      ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Text(
                name,
                style: context.themeData.textTheme.bodyMedium?.copyWith(
                  color: selBottom == selectedIndex
                      ? AppPaletteLight.textColor
                      : AppPaletteLight.lightBlack,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  fontSize: 11,
                ),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ],
    );
  }

  Widget _getBottomBar() {
    return AnimatedContainer(
      duration: Duration(
        milliseconds:
            context.watch<BottomNavigationProvider>().getBars ? 500 : 500,
      ),
      padding: EdgeInsets.only(
          bottom:
              Platform.isIOS ? MediaQuery.of(context).viewPadding.bottom : 0),
      height: context.watch<BottomNavigationProvider>().getBars
          ? kBottomNavigationBarHeight +
              (Platform.isIOS
                  ? MediaQuery.of(context).viewPadding.bottom > 8
                      ? 8
                      : MediaQuery.of(context).viewPadding.bottom
                  : 0)
          : 0,
      decoration: BoxDecoration(
        color: AppPaletteLight.background,
        boxShadow: [
          BoxShadow(
            color: AppPaletteLight.gray,
            blurRadius: selBottom == 2 ? 0 : 5,
          )
        ],
      ),
      child: TabBar(
        isScrollable: false,
        controller: _tabController,
        indicatorPadding: EdgeInsets.zero,
        labelPadding: EdgeInsets.zero,
        tabs: [
          Tab(
            child: getTabItem(
              'light_active_home',
              'home',
              0,
              texts.home,
            ),
          ),
          Tab(
            child: getTabItem(
              'light_active_category',
              'category',
              1,
              texts.category,
            ),
          ),
          Tab(
              child: Stack(
            children: [
              getTabItem(
                'light_active_cart',
                'cart',
                2,
                texts.cart,
              ),
              Positioned.directional(
                end: 0,
                textDirection: Directionality.of(context),
                top: 0,
                child: Container(
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: AppPaletteLight.primary),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: Text("0",
                            style: context.themeData.textTheme.bodyMedium
                                ?.copyWith(
                                    fontSize: 8,
                                    fontWeight: FontWeight.bold,
                                    color: AppPaletteLight.background)),
                      ),
                    )),
              )
            ],
          )),
          Tab(
            child: getTabItem(
              'light_active_profile',
              'profile',
              3,
              texts.account,
            ),
          ),
        ],
        indicatorColor: Colors.transparent,
        labelColor: AppPaletteLight.primary,
        // isScrollable: false,
        labelStyle: const TextStyle(fontSize: 12),
      ),
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _tabController.dispose();
    super.dispose();
  }
}
