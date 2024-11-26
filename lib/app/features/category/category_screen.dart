import 'package:flip_coin/app/core/assets/constant_images.dart';
import 'package:flip_coin/app/core/custom/text.dart';
import 'package:flip_coin/app/core/extensions/context_extension.dart';
import 'package:flip_coin/app/core/theme/app_palette.dart';
import 'package:flip_coin/app/features/bottom_navigation/bottom_navigation_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

class CategoryScreen extends StatefulWidget {
  final bool? isBackButton;
  final String? type;

  const CategoryScreen({super.key, this.isBackButton = true, this.type});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  String? selectedTab;

  @override
  void initState() {
    selectedTab = widget.type;
    super.initState();
  }

  final List<String> imageUrls = [
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
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () async {
        if (widget.isBackButton == true) {
          return true;
        }
        Provider.of<BottomNavigationProvider>(context, listen: false)
            .onTapped(0);
        return false;
      },
      child: Scaffold(

        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppPaletteLight.secondaryLight,
          title: Text(
            texts.allCategories,
            textAlign: TextAlign.center,
            style: context.themeData.textTheme.labelLarge?.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              overflow: TextOverflow.ellipsis,
              color: AppPaletteLight.background,
            ),
          ),
          actions: [
            Icon(
              Icons.search,
              color: AppPaletteLight.background,
              size: 30,
            ),
            const SizedBox(
              width: 10,
            ),
          ],
        ),
        body: Container(
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
            child: categoryList()),
      ),
    );
  }

  Widget categoryList() {
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: StaggeredGridView.countBuilder(
        crossAxisCount: screenWidth > 600 ? 6 : 4,
        itemCount: imageUrls.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: <Color>[
                      AppPaletteLight.gradient1,
                      AppPaletteLight.gradient2,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    imageUrls[index],
                    fit: BoxFit.contain,
                  ) /*CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: imageUrls[index],
                    placeholder: (context, url) => ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        ConstantImage.appLogo,
                        fit: BoxFit.contain,
                      ),
                    ),
                    errorWidget: (context, url, error) => ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        ConstantImage.appLogo,
                        fit: BoxFit.contain,
                      ),
                    ),
                  )*/
                  ,
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                "Mutton Biryani",
                textAlign: TextAlign.center,
                maxLines: 2,
                style: context.themeData.textTheme.labelMedium?.copyWith(
                  fontSize: 16,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          );
        },
        staggeredTileBuilder: (int index) => const StaggeredTile.fit(2),
        mainAxisSpacing: 12.0,
        crossAxisSpacing: 12.0,
      ),
    );
  }
}
