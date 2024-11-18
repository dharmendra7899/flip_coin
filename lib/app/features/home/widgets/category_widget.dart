import 'package:flip_coin/app/core/assets/constant_images.dart';
import 'package:flip_coin/app/core/extensions/context_extension.dart';
import 'package:flip_coin/app/core/theme/app_palette.dart';
import 'package:flutter/material.dart';

class CategoryWidget extends StatefulWidget {
  const CategoryWidget({super.key});

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
    ConstantImage.download,
    ConstantImage.egg,
    ConstantImage.download,
    ConstantImage.egg,
    ConstantImage.download,
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Categories',
            textAlign: TextAlign.center,
            style: context.themeData.textTheme.labelMedium
                ?.copyWith(fontSize: 20, overflow: TextOverflow.ellipsis),
          ),
          Text(
            'Reccomened for you',
            textAlign: TextAlign.center,
            maxLines: 1,
            style: context.themeData.textTheme.labelSmall?.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppPaletteLight.gray,
                overflow: TextOverflow.ellipsis),
          ),
          const SizedBox(height: 16),
          Center(
            child: SizedBox(
              height: 200,
              child: GridView.count(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                childAspectRatio: 1.1,
                children: [
                  _buildCategoryItem('Noodles', ConstantImage.noodle),
                  _buildCategoryItem('Coffee', ConstantImage.coffee),
                  _buildCategoryItem('Biryani', ConstantImage.biryani),
                  _buildCategoryItem('Noodles', ConstantImage.noodle),
                  _buildCategoryItem('Noodles', ConstantImage.noodle),
                  _buildCategoryItem('Coffee', ConstantImage.coffee),
                  _buildCategoryItem('Cake', ConstantImage.cake),
                  _buildCategoryItem('Noodles', ConstantImage.noodle),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryItem(String label, String asset) {
    return Column(
      children: [
        Container(
          height: 70,
          width: 70,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.red.shade50,
          ),
          child: Center(
              child: Image.asset(
                asset,
                height: 70,
                width: 70,
                fit: BoxFit.cover,
              )),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          textAlign: TextAlign.center,
          maxLines: 2,
          style: context.themeData.textTheme.bodyMedium?.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              overflow: TextOverflow.ellipsis),
        ),
      ],
    );
  }
}
