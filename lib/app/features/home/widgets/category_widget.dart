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
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
       /*   Text(
            'Find stores by Category',
            textAlign: TextAlign.center,
            style: context.themeData.textTheme.labelMedium?.copyWith(
              fontSize: 20,
              overflow: TextOverflow.ellipsis,
            ),
          ),*/
          const SizedBox(height: 12),
          Center(
            child: SizedBox(
                height: 150,
                child: ListView.builder(
                  itemCount: imageUrls.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 12.0),
                      child: _buildCategoryItem("Biryani",imageUrls[index]),
                    );
                  },
                )),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryItem(String label, String asset) {
    return Column(
      children: [
        Container(
          height: 100,
          width:100,
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppPaletteLight.gray, width: 0.7),
            color: Colors.red.shade50,
          ),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                asset,
                height: 100,
                width:100,
                fit: BoxFit.cover,
              )),
        ),
        const SizedBox(height: 4),
        SizedBox(width: 90,
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
    );
  }
}
