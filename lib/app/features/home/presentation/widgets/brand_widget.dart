import 'package:flip_coin/app/core/assets/constant_images.dart';
import 'package:flip_coin/app/core/custom/text.dart';
import 'package:flip_coin/app/core/extensions/context_extension.dart';
import 'package:flip_coin/app/core/theme/app_palette.dart';
import 'package:flip_coin/app/features/category/presentation/all_categories.dart';
import 'package:flip_coin/app/routes/navigation.dart';
import 'package:flutter/material.dart';

class BrandWidget extends StatefulWidget {
  const BrandWidget({super.key});

  @override
  State<BrandWidget> createState() => _BrandWidgetState();
}

class _BrandWidgetState extends State<BrandWidget> {
  final List<String> imageUrls = [
    ConstantImage.chicken,
    ConstantImage.mutton,
    ConstantImage.egg,
    ConstantImage.bir,
    ConstantImage.chick,
    ConstantImage.bir,
    ConstantImage.chick,
    ConstantImage.chicken,
    ConstantImage.download,
    ConstantImage.egg,
    ConstantImage.download,
    ConstantImage.egg,
    ConstantImage.download,
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Text(
          //       texts.brands,
          //       textAlign: TextAlign.center,
          //       style: context.themeData.textTheme.labelMedium?.copyWith(
          //         fontSize: 18,
          //         fontWeight: FontWeight.w600,
          //         overflow: TextOverflow.ellipsis,
          //       ),
          //     ),
          //     Text(
          //       texts.seeAll,
          //       style: context.themeData.textTheme.bodyMedium?.copyWith(
          //         fontSize: 16,
          //         fontWeight: FontWeight.w500,
          //         color: AppPaletteLight.primary,
          //       ),
          //     ),
          //   ],
          // ),
          // const SizedBox(height: 12),
          Center(
            child: SizedBox(
                height: 120,
                child: ListView.builder(
                  itemCount: imageUrls.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 12.0),
                      child: _buildCategoryItem("Biryani", imageUrls[index]),
                    );
                  },
                )),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryItem(String label, String asset) {
    return GestureDetector(
      onTap: ()=> navigateTo(context: context, to: const AllCategories()),
      child: Column(
        children: [
          Container(
            height: 80,
            width: 110,
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: AppPaletteLight.gray, width: 0.7),
              color: Colors.red.shade50,
            ),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset(
                  asset,
                  height: 80,
                  width: 110,
                  fit: BoxFit.cover,
                )),
          ),
          const SizedBox(height: 4),
          SizedBox(
            width: 90,
            child: Text(
              "label",
              textAlign: TextAlign.center,
              maxLines: 2,
              style: context.themeData.textTheme.bodyMedium?.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  overflow: TextOverflow.ellipsis),
            ),
          ),
        ],
      ),
    );
  }
}
