import 'package:flip_coin/app/core/assets/constant_images.dart';
import 'package:flip_coin/app/core/custom/app_button.dart';
import 'package:flip_coin/app/core/custom/fixed_gridview_height.dart';
import 'package:flip_coin/app/core/extensions/context_extension.dart';
import 'package:flip_coin/app/core/theme/app_palette.dart';
import 'package:flutter/material.dart';

class KadakWidget extends StatelessWidget {
  const KadakWidget({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  BoxDecoration(
        gradient: LinearGradient(
            colors: [
               AppPaletteLight.secondaryLight.withOpacity(0.7),
               AppPaletteLight.bgColor,
            ],
            begin: FractionalOffset.topCenter,
            end: FractionalOffset.bottomCenter,
            tileMode: TileMode.repeated),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
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
                itemCount: 6,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: _buildCategoryItem(
                        context, "Biryani", ConstantImage.coffee),
                  );
                },
                gridDelegate: const FixedGridViewHeight(
                    crossAxisCount: 3,
                    height: 165,
                    mainAxisSpacing: 4),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryItem(BuildContext context, String label, String asset) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: AppPaletteLight.lightBlack, width: 0.4),
              boxShadow: boxShadow(),
              color: AppPaletteLight.background),
          child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: Text(
                  "Home & Kitchen Needs",
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: context.themeData.textTheme.bodyMedium?.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      overflow: TextOverflow.ellipsis),
                ),
              ),
              ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    asset,
                    height: 80,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  )),
              const SizedBox(
                height: 6,
              ),
              Container(
                height: 25,
                decoration: const BoxDecoration(
                    color: AppPaletteLight.primary,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    )),
                child: Center(
                  child: Text(
                    "99 Onwards",
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    style: context.themeData.textTheme.bodyMedium?.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: AppPaletteLight.background,
                        overflow: TextOverflow.ellipsis),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
