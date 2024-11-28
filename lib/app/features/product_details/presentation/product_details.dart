import 'dart:io';

import 'package:flip_coin/app/core/assets/constant_images.dart';
import 'package:flip_coin/app/core/custom/text.dart';
import 'package:flip_coin/app/core/extensions/context_extension.dart';
import 'package:flip_coin/app/core/helper_function/helper_function.dart';
import 'package:flip_coin/app/core/theme/app_palette.dart';
import 'package:flip_coin/app/features/category/presentation/widget/rating_widget.dart';
import 'package:flip_coin/app/features/home/presentation/widgets/product_widgets.dart';
import 'package:flip_coin/app/features/product_details/presentation/product_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductDetails extends StatefulWidget {
  final bool fromCart;
  final int? secPos, index;
  final bool? list;
  final int? selectedVarientIndex;

  const ProductDetails(
      {super.key,
      this.index,
      this.secPos,
      this.list,
      this.fromCart = false,
      this.selectedVarientIndex});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails>
    with TickerProviderStateMixin {
  late final AnimationController buttonAnimationController =
      AnimationController(
          vsync: this, duration: const Duration(milliseconds: 300));

  late final Animation<double> heightAnimation = Tween<double>(
    begin: Platform.isIOS ? 70 : 50, // Initial height
    end: 0, // Final height
  ).animate(
    CurvedAnimation(
      parent: buttonAnimationController,
      curve: const Interval(0.0, 1.0, curve: Curves.linear),
    ),
  );

  List<String> sliderList = [
    ConstantImage.mutton,
    ConstantImage.bir,
    ConstantImage.chick
  ];

  int _curSlider = 0;
  final _pageController = PageController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  ChoiceChip? choiceChip, tagChip;
  Widget? choiceContainer;

  Animation? buttonSqueezeAnimation;
  AnimationController? buttonController;
  bool loading = true;
  ScrollController controller = ScrollController();

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(
        handler(i, list[i]),
      );
    }

    return result;
  }

  _scrollListener() {
    if (controller.offset >= controller.position.maxScrollExtent &&
        !controller.position.outOfRange) {
      if (mounted) {
        if (mounted) {}
      }
    }
  }

  Future<void> _playAnimation() async {
    try {
      await buttonController!.forward();
    } on TickerCanceled {
      debugPrint("hello");
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key: _scaffoldKey,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: <Widget>[
                getSilverAppBar(),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            color: AppPaletteLight.background,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text("Chicken Biryani",
                                      style: context
                                          .themeData.textTheme.bodyMedium
                                          ?.copyWith(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              color: AppPaletteLight.textColor)),
                                  Text("Chicken Biryani test demo user",
                                      style: context
                                          .themeData.textTheme.bodyMedium
                                          ?.copyWith(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                              color: AppPaletteLight.textColor)),
                                  Text(
                                    "₹299",
                                    textAlign: TextAlign.start,
                                    maxLines: 1,
                                    style: context.themeData.textTheme.bodyMedium
                                        ?.copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    "MRP 349",
                                    textAlign: TextAlign.start,
                                    maxLines: 1,
                                    style: context.themeData.textTheme.bodyMedium
                                        ?.copyWith(
                                      fontSize: 13,
                                      color: AppPaletteLight.gray,
                                      decoration: TextDecoration.lineThrough,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    "143 ${texts.tax}",
                                    textAlign: TextAlign.start,
                                    maxLines: 1,
                                    style: context.themeData.textTheme.bodySmall
                                        ?.copyWith(
                                      fontSize: 10,
                                      color: AppPaletteLight.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),

                                ],
                              ),
                            ),
                          ),
                          GetRatingWidget(
                            ratting: "5",
                            noOfRatting: "4",
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Divider(),
                         // const SpeciExtraBtnDetails(),
                         //  ReviewWidget(
                         //    secPos: 1,
                         //    widgetindex: widget.index,
                         //  ),
                        //  const Divider(),
                          ProductList(sectionTitle: texts.moreProduct),
                          ProductList(sectionTitle: texts.lookingFor),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  getSilverAppBar() {
    return SliverAppBar(
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      expandedHeight: MediaQuery.of(context).size.height * 0.40,
      floating: false,
      pinned: true,
      backgroundColor: AppPaletteLight.background,
      stretch: true,
      leading: Material(
        color: Colors.transparent,
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  color: Color(0x1a0400ff),
                  offset: Offset(0, 0),
                  blurRadius: 30,
                )
              ],
              color: AppPaletteLight.background,
              borderRadius: BorderRadius.circular(7),
            ),
            width: 33,
            height: 33,
            alignment: Alignment.center,
            child: InkWell(
              onTap: () => Navigator.of(context).pop(),
              child: const Icon(Icons.arrow_back,
                  color: AppPaletteLight.textColor),
            ),
          ),
        ),
      ),
      actions: [
        Container(
          margin: const EdgeInsets.all(6),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                7,
              ),
              color: AppPaletteLight.background),
          width: 33,
          height: 33,
          alignment: Alignment.center,
          child: const Icon(
            Icons.share,
            size: 20.0,
            color: AppPaletteLight.primary,
          ),
        ),
        Container(
          margin: const EdgeInsets.all(6),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                7,
              ),
              color: AppPaletteLight.background),
          width: 33,
          height: 33,
          alignment: Alignment.center,
          child: Stack(
            children: [
              Center(
                child: SvgPicture.asset(
                  DesignConfiguration.setSvgPath('appbarCart'),
                  colorFilter: const ColorFilter.mode(
                      AppPaletteLight.primary, BlendMode.srcIn),
                ),
              ),
             /* false
                  ? Positioned(
                bottom: 5,
                right: 5,
                child: Container(
                  height: 20,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppPaletteLight.primary),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(3),
                      child: Text(
                        "0",
                        style: context.themeData.textTheme.labelLarge
                            ?.copyWith(
                            color: AppPaletteLight.background,
                            fontWeight: FontWeight.w500,
                            fontSize: 8),
                      ),
                    ),
                  ),
                ),
              )
                  : const SizedBox()*/
            ],
          )
        ),
        Container(
          margin: const EdgeInsets.all(6),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                7,
              ),
              color: AppPaletteLight.background),
          width: 33,
          height: 33,
          alignment: Alignment.center,
          child: const Icon(
            Icons.favorite_border,
            size: 20.0,
            color: AppPaletteLight.primary,
          )
        ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        background: _slider(),
      ),
    );
  }

  Widget _slider() {
    return LayoutBuilder(
      builder: (context, constraints) {
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (_, __, ___) => ProductPreview(
                  pos: _curSlider,
                  index: widget.index,
                  id: "2",
                  imgList: sliderList,
                  list: widget.list,
                  from: true,
                ),
              ),
            );
          },
          child: Stack(
            children: <Widget>[
              Hero(
                tag: '$texts.heroTagUniqueString${widget.index}2',
                child: PageView.builder(
                  itemCount: sliderList.length,
                  scrollDirection: Axis.horizontal,
                  controller: _pageController,
                  reverse: false,
                  onPageChanged: (index) {
                    setState(
                      () {
                        _curSlider = index;
                      },
                    );
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return Stack(
                      children: [
                        Image.asset(
                          sliderList[index],
                          height: constraints.maxHeight,
                          width: constraints.maxWidth,
                          fit: BoxFit.fill,
                        )

                        // DesignConfiguration.getCacheNotworkImage(
                        //   boxFit: BoxFit.cover,
                        //   context: context,
                        //   heightvalue: constraints.maxHeight,
                        //   widthvalue: constraints.maxWidth,
                        //   placeHolderSize:
                        //   MediaQuery
                        //       .of(context)
                        //       .size
                        //       .width * 1,
                        //   imageurlString: sliderList[index]!,
                        // )
                      ],
                    );
                  },
                ),
              ),
              Positioned.directional(
                textDirection: Directionality.of(context),
                bottom: 30,
                height: 20,
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: map<Widget>(
                        sliderList,
                        (index, url) {
                          return AnimatedContainer(
                            duration: const Duration(milliseconds: 500),
                            width: 8.0,
                            height: 8.0,
                            margin: const EdgeInsets.symmetric(
                              vertical: 2.0,
                              horizontal: 4.0,
                            ),
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(4)),
                              color: _curSlider == index
                                  ? AppPaletteLight.primary
                                  : AppPaletteLight.background,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
              indicatorImage(),
            ],
          ),
        );
      },
    );
  }

  indicatorImage() {
    String? indicator = "2";
    return Positioned.fill(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: indicator == '1'
              ? SvgPicture.asset(
                  DesignConfiguration.setSvgPath('vag'),
                )
              : indicator == '2'
                  ? SvgPicture.asset(
                      DesignConfiguration.setSvgPath('nonvag'),
                    )
                  : const SizedBox(),
        ),
      ),
    );
  }
}
