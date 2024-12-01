import 'package:flip_coin/app/core/custom/text.dart';
import 'package:flip_coin/app/core/extensions/context_extension.dart';
import 'package:flip_coin/app/core/helper_function/helper_function.dart';
import 'package:flip_coin/app/core/theme/app_palette.dart';
import 'package:flip_coin/app/features/bottom_navigation/provider/bottom_navigation_provider.dart';
import 'package:flip_coin/app/routes/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class SearchBarHeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        10,
        0,
        10,
        0,
      ),
      child: Align(
        alignment: Alignment.topCenter,
        child: Container(
          height: 50,
          margin: const EdgeInsets.only(top: 8),
          decoration: BoxDecoration(
              color: AppPaletteLight.background,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: AppPaletteLight.textColor.withOpacity(0.2),
              )),
          padding: const EdgeInsetsDirectional.only(start: 10, end: 10),
          child: Row(
            children: [
              Expanded(
                child: InkWell(
                  child: Row(children: [
                    SvgPicture.asset(
                      DesignConfiguration.setSvgPath('homepage_search'),
                      height: 15,
                      width: 15,
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(start: 15),
                      child: Text(
                        texts.search,
                        style: context.themeData.textTheme.bodyMedium?.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          overflow: TextOverflow.ellipsis,
                          color: AppPaletteLight.lightBlack,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    )
                  ]),
                  onTap: () {
                    // Routes.navigateToSearchScreen(context);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: InkWell(
                  onTap: () {
                    context
                        .read<BottomNavigationProvider>()
                        .setMicClickBtn(true);
                  },
                  child: SvgPicture.asset(
                    DesignConfiguration.setSvgPath('voice_search'),
                    height: 20,
                    width: 20,
                    colorFilter: const ColorFilter.mode(
                        AppPaletteLight.lightBlack, BlendMode.srcIn),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  double get maxExtent => 65;

  @override
  double get minExtent => 65;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
