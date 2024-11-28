import 'package:flip_coin/app/core/assets/constant_images.dart';
import 'package:flip_coin/app/core/custom/fixed_gridview_height.dart';
import 'package:flip_coin/app/core/extensions/context_extension.dart';
import 'package:flip_coin/app/core/theme/app_palette.dart';
import 'package:flip_coin/app/features/category/presentation/all_categories.dart';
import 'package:flip_coin/app/routes/navigation.dart';
import 'package:flutter/material.dart';

class CategoryWidget extends StatefulWidget {
  const CategoryWidget({super.key, required this.title});

  final String title;

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  final List<String> imageUrls = [
    ConstantImage.chicken,
    ConstantImage.mutton,
    ConstantImage.egg,
    ConstantImage.bir,
    ConstantImage.chick,
    ConstantImage.bir,
    ConstantImage.chick,
    ConstantImage.chicken,
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          textAlign: TextAlign.center,
          style: context.themeData.textTheme.labelMedium?.copyWith(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const SizedBox(height: 12),
        Center(
          child: GridView.builder(
            itemCount: imageUrls.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: _buildCategoryItem("Biryani", imageUrls[index]),
              );
            },
            gridDelegate: const FixedGridViewHeight(
                crossAxisCount: 4,
                height: 130,
                crossAxisSpacing: 6,
                mainAxisSpacing: 6),
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryItem(String label, String asset) {
    return GestureDetector(onTap: () => navigateTo(context: context, to: const AllCategories()),
      child: Column(
        children: [
          Container(
            height: 80,
            width: 90,
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppPaletteLight.gray, width: 0.9),
              color: Colors.red.shade50,
            ),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  asset,
                  height: 80,
                  width: 90,
                  fit: BoxFit.fill,
                )),
          ),
          const SizedBox(height: 4),
          SizedBox(
            width: 90,
            child: Text(
              "Chicken Biryani",
              textAlign: TextAlign.center,
              maxLines: 2,
              style: context.themeData.textTheme.bodyMedium?.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  overflow: TextOverflow.ellipsis),
            ),
          ),
        ],
      ),
    );
  }
}
