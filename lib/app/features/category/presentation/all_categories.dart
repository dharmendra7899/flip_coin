import 'package:flip_coin/app/core/custom/custom_image_view.dart';
import 'package:flip_coin/app/core/custom/text.dart';
import 'package:flip_coin/app/core/extensions/context_extension.dart';
import 'package:flip_coin/app/core/helper_function/helper_function.dart';
import 'package:flip_coin/app/core/theme/app_palette.dart';
import 'package:flip_coin/app/features/category/presentation/widget/category_prodcuts.dart';
import 'package:flip_coin/app/features/category/provider/category_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../core/assets/constant_images.dart';

class AllCategories extends StatefulWidget {
  const AllCategories({super.key});

  @override
  State<AllCategories> createState() => _AllCategoriesState();
}

class _AllCategoriesState extends State<AllCategories>
    with TickerProviderStateMixin {
  late AnimationController buttonController;
  late Animation<double> buttonSqueezeAnimation;

  final List<String> catList = [
    ConstantImage.egg,
    ConstantImage.bir,
    ConstantImage.chick,
    ConstantImage.bir,
    ConstantImage.chick,
    ConstantImage.download,
    ConstantImage.egg,
    ConstantImage.download,
    ConstantImage.egg,
    ConstantImage.bir,
    ConstantImage.chick,
    ConstantImage.bir,
    ConstantImage.chick,
    ConstantImage.download,
    ConstantImage.egg,
    ConstantImage.download,
  ];

  @override
  void initState() {
    super.initState();
    buttonController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final screenWidth = MediaQuery.of(context).size.width;
    buttonSqueezeAnimation = Tween<double>(
      begin: screenWidth * 0.7,
      end: 50.0,
    ).animate(
      CurvedAnimation(
        parent: buttonController,
        curve: const Interval(0.0, 0.150),
      ),
    );
  }

  Future<void> _playAnimation() async {
    try {
      await buttonController.forward();
    } on TickerCanceled {
      // Handle animation cancelation
    }
  }

  @override
  void dispose() {
    buttonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Text(
          texts.grocery,
          style: context.themeData.textTheme.labelLarge?.copyWith(
              color: AppPaletteLight.textColor,
              fontWeight: FontWeight.w600,
              fontSize: 18),
        ),
        actions: const [
          Icon(
            Icons.search,
            size: 25,
            color: AppPaletteLight.textColor,
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: Consumer<CategoryProvider>(
        builder: (context, categoryProvider, _) {
          if (categoryProvider.catLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (categoryProvider.catList.isEmpty) {
            return Center(
              child: Text(
                'No categories available',
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black54,
                    ),
              ),
            );
          }

          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  decoration: const BoxDecoration(
                    color: AppPaletteLight.surfaceBright,
                    boxShadow: [
                      BoxShadow(
                        color: AppPaletteLight.gray,
                      )
                    ],
                  ),
                  //color: Colors.grey[200],
                  child: NotificationListener<OverscrollIndicatorNotification>(
                    onNotification: (overscroll) {
                      overscroll.disallowIndicator();
                      return true;
                    },
                    child: ListView.builder(
                      padding: const EdgeInsetsDirectional.only(top: 10.0),
                      itemCount: catList.length,
                      itemBuilder: (context, index) {
                        return Selector<CategoryProvider, int>(
                          selector: (_, cat) => cat.curCat,
                          builder: (context, selectedIndex, child) {
                            final isSelected = index == selectedIndex;
                            return GestureDetector(
                              onTap: () {
                                categoryProvider.setCurSelected(index);
                                categoryProvider.setSubList(
                                  catList,
                                );
                              },
                              child: Container(
                                height: 100,
                                decoration: BoxDecoration(
                                  color: isSelected
                                      ? AppPaletteLight.background
                                      : Colors.transparent,
                                  border: isSelected
                                      ? const Border(
                                          right: BorderSide(
                                              width: 5.0,
                                              color: AppPaletteLight.primary,
                                              style: BorderStyle.solid),
                                        )
                                      : null,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(5),
                                        child: CustomImage(
                                          image: catList[index],
                                          fit: BoxFit.cover,
                                          height: 60,
                                          width: 60,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      'Food',
                                      textAlign: TextAlign.center,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(
                                            color: isSelected
                                                ? Colors.blue
                                                : Colors.black54,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  color: AppPaletteLight.background,
                  child: Column(
                    children: [
                      Selector<CategoryProvider, int>(
                        selector: (_, cat) => cat.curCat,
                        builder: (context, selectedIndex, child) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6),
                                        border: Border.all(
                                            width: 0.5,
                                            color: AppPaletteLight.lightBlack)),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5.0, horizontal: 12),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          SvgPicture.asset(
                                              DesignConfiguration.setSvgPath(
                                                  'filter'),
                                              colorFilter:
                                                  const ColorFilter.mode(
                                                      AppPaletteLight
                                                          .lightBlack,
                                                      BlendMode.srcIn)),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            'Filter',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge!
                                                .copyWith(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w400),
                                          ),
                                          const Icon(
                                            Icons.arrow_drop_down,
                                            color: AppPaletteLight.lightBlack,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 12,
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6),
                                        border: Border.all(
                                            width: 0.5,
                                            color: AppPaletteLight.lightBlack)),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5.0, horizontal: 12),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          SvgPicture.asset(
                                              DesignConfiguration.setSvgPath(
                                                  'sortby'),
                                              colorFilter:
                                                  const ColorFilter.mode(
                                                      AppPaletteLight
                                                          .lightBlack,
                                                      BlendMode.srcIn)),
                                          const SizedBox(
                                            width: 4,
                                          ),
                                          Text(
                                            'Sort',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge!
                                                .copyWith(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w400),
                                          ),
                                          const Icon(
                                            Icons.arrow_drop_down,
                                            color: AppPaletteLight.lightBlack,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 12,
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6),
                                        border: Border.all(
                                            width: 0.5,
                                            color: AppPaletteLight.lightBlack)),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5.0, horizontal: 8),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [

                                          Text(
                                            'Brands',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge!
                                                .copyWith(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w400),
                                          ),
                                          Text(
                                            ' (1)',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge!
                                                .copyWith(
                                                fontSize: 12,
                                                fontWeight:
                                                FontWeight.w500),
                                          ),
                                          const Icon(
                                            Icons.arrow_drop_down,
                                            color: AppPaletteLight.lightBlack,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Selector<CategoryProvider, List<String>>(
                            selector: (_, cat) => catList,
                            builder: (context, subList, child) {
                              return subList.isNotEmpty
                                  ? const CategoryProdcuts()
                                  : Center(
                                      child: Text(
                                        texts.noItem,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                      ),
                                    );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
