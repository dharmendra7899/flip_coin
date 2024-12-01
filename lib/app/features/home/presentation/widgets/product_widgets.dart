import 'package:flip_coin/app/core/assets/constant_images.dart';
import 'package:flip_coin/app/core/custom/text.dart';
import 'package:flip_coin/app/core/extensions/context_extension.dart';
import 'package:flip_coin/app/core/theme/app_palette.dart';
import 'package:flip_coin/app/features/product_details/presentation/product_details.dart';
import 'package:flutter/material.dart';

class ProductList extends StatelessWidget {
  final String sectionTitle;
  final bool? seeAll;

  const ProductList(
      {super.key, required this.sectionTitle, this.seeAll = true});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                sectionTitle,
                style: context.themeData.textTheme.bodyMedium?.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    overflow: TextOverflow.ellipsis),
              ),
              seeAll == true
                  ? Text(
                      texts.seeAll,
                      style: context.themeData.textTheme.bodyMedium?.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppPaletteLight.primary,
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 220,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return _buildCategoryItem(context);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryItem(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (_, __, ___) => const ProductDetails(
              index: 1,
              secPos: 0,
              list: true,
            ),
          ),
        );
      },
      child: Column(
        children: [
          Container(
            width: 140,
            margin: const EdgeInsets.only(right: 12),
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppPaletteLight.gray, width: 0.7),
                color: AppPaletteLight.background),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          ConstantImage.mutton,
                          height: 125,
                          width: 150,
                          fit: BoxFit.cover,
                        )),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 4),
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12),
                          ),
                          color: AppPaletteLight.primary),
                      child: Text(
                        "12%\nOff",
                        textAlign: TextAlign.start,
                        maxLines: 2,
                        style: context.themeData.textTheme.bodyMedium?.copyWith(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: AppPaletteLight.background),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 4),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    "Chicken biryani",
                    textAlign: TextAlign.start,
                    maxLines: 2,
                    style: context.themeData.textTheme.bodyMedium?.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        overflow: TextOverflow.ellipsis),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            "₹299",
                            textAlign: TextAlign.start,
                            maxLines: 1,
                            style: context.themeData.textTheme.bodyMedium
                                ?.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            "₹349",
                            textAlign: TextAlign.start,
                            maxLines: 1,
                            style: context.themeData.textTheme.bodyMedium
                                ?.copyWith(
                              fontSize: 12,
                              color: AppPaletteLight.gray,
                              decoration: TextDecoration.lineThrough,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: AppPaletteLight.primary),
                          child: Text(
                            "Add",
                            style: context.themeData.textTheme.bodyMedium
                                ?.copyWith(
                              fontSize: 10,
                              color: AppPaletteLight.background,
                              fontWeight: FontWeight.bold,
                            ),
                          ))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
