

import 'package:flip_coin/app/core/custom/custom_image_view.dart';
import 'package:flip_coin/app/core/custom/text.dart';
import 'package:flip_coin/app/core/theme/app_palette.dart';
import 'package:flip_coin/app/features/category/provider/category_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../core/assets/constant_images.dart';

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
    return Consumer<CategoryProvider>(
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
                decoration: BoxDecoration(
                  color: AppPaletteLight.surfaceBright,
                  boxShadow: [
                    BoxShadow(
                      color: AppPaletteLight.gray,
                    //  blurRadius: selBottom == 2 ? 0 : 5,
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
                                          style: BorderStyle.solid
                                        ),
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
              child: Column(
                children: [
                  Selector<CategoryProvider, int>(
                    selector: (_, cat) => cat.curCat,
                    builder: (context, selectedIndex, child) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(
                              'Selected Category',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            const Expanded(
                              child: Divider(thickness: 2),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  Expanded(
                    child: Selector<CategoryProvider, List<String>>(
                      selector: (_, cat) => catList,
                      builder: (context, subList, child) {
                        return subList.isNotEmpty
                            ? GridView.builder(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                ),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  childAspectRatio: 0.75,
                                      mainAxisSpacing: 8, crossAxisSpacing: 8

                                ),
                                itemCount: subList.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      // Handle sub-category tap
                                    },
                                    child: Column(
                                      children: [
                                        Expanded(
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: CustomImage(
                                              image: subList[index],
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          'Chicken Biryani',
                                          textAlign: TextAlign.center,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall,
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              )
                            : Center(
                                child: Text(
                                  texts.noItem,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
