import 'package:flip_coin/app/core/assets/constant_images.dart';
import 'package:flip_coin/app/core/custom/fixed_gridview_height.dart';
import 'package:flip_coin/app/core/extensions/context_extension.dart';
import 'package:flip_coin/app/core/theme/app_palette.dart';
import 'package:flip_coin/app/features/product_details/presentation/product_details.dart';
import 'package:flutter/material.dart';

class CategoryProdcuts extends StatefulWidget {
  const CategoryProdcuts({super.key});

  @override
  State<CategoryProdcuts> createState() => _CategoryProdcutsState();
}

class _CategoryProdcutsState extends State<CategoryProdcuts> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 15,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.only(right: 12.0),
          child: _buildCategoryItem(),
        );
      },
      gridDelegate: const FixedGridViewHeight(
          crossAxisCount: 2,
          height: 220,
          crossAxisSpacing: 6,
          mainAxisSpacing: 6),
    );
  }

  Widget _buildCategoryItem() {
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
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 110,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppPaletteLight.gray.withOpacity(0.19),
                ),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      height: 110,
                      width: 200,
                      ConstantImage.mutton,
                      fit: BoxFit.fill,
                    )),
              ),
              const SizedBox(height: 8),
              Text(
                "Green Kiwi Garlic peeled ",
                textAlign: TextAlign.start,
                maxLines: 2,
                style: context.themeData.textTheme.bodyMedium?.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    overflow: TextOverflow.ellipsis),
              ),
              const SizedBox(height: 4),
              Text(
                "12% OFF",
                textAlign: TextAlign.center,
                maxLines: 1,
                style: context.themeData.textTheme.bodyMedium?.copyWith(
                  fontSize: 12,
                  color: AppPaletteLight.blueColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  Text(
                    "₹299",
                    textAlign: TextAlign.start,
                    maxLines: 1,
                    style: context.themeData.textTheme.bodyMedium?.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    "MRP 349",
                    textAlign: TextAlign.start,
                    maxLines: 1,
                    style: context.themeData.textTheme.bodyMedium?.copyWith(
                      fontSize: 13,
                      color: AppPaletteLight.gray,
                      decoration: TextDecoration.lineThrough,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              )
            ],
          ),
          Positioned(
            top: 87,
            right: 0,
            child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppPaletteLight.primary),
                child: Text(
                  "Add",
                  style: context.themeData.textTheme.bodyMedium?.copyWith(
                    fontSize: 12,
                    color: AppPaletteLight.background,
                    fontWeight: FontWeight.bold,
                  ),
                )),
          )
        ],
      ),
    );
  }
}
