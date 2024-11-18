import 'package:flip_coin/app/core/assets/constant_images.dart';
import 'package:flip_coin/app/core/custom/text.dart';
import 'package:flip_coin/app/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class ProductWidgets extends StatefulWidget {
  const ProductWidgets({super.key});

  @override
  State<ProductWidgets> createState() => _ProductWidgetsState();
}

class _ProductWidgetsState extends State<ProductWidgets> {
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Bestsellers',
                textAlign: TextAlign.center,
                style: context.themeData.textTheme.labelMedium
                    ?.copyWith(fontSize: 20, overflow: TextOverflow.ellipsis),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  texts.seeAll,
                  textAlign: TextAlign.center,
                  style: context.themeData.textTheme.labelSmall?.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      overflow: TextOverflow.ellipsis),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 4,
            childAspectRatio: 0.7,
            children: List.generate(imageUrls.length, (index) {
              return _buildProductItem(imageUrls[index]);
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildProductItem(String image) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.grey.shade200,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                image,
                fit: BoxFit.cover,
              ),
            )),
        const SizedBox(
          height: 5,
        ),
        Text(
          'Chicken Biryani',
          textAlign: TextAlign.center,
          maxLines: 2,
          style: context.themeData.textTheme.bodyMedium?.copyWith(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              overflow: TextOverflow.ellipsis),
        ),
      ],
    );
  }
}
