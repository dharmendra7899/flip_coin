import 'package:flip_coin/app/core/assets/constant_images.dart';
import 'package:flip_coin/app/core/custom/app_button.dart';
import 'package:flip_coin/app/core/custom/text.dart';
import 'package:flip_coin/app/core/extensions/context_extension.dart';
import 'package:flip_coin/app/core/helper_function/helper_function.dart';
import 'package:flip_coin/app/core/theme/app_palette.dart';
import 'package:flutter/material.dart';

class CartWidget extends StatefulWidget {
  const CartWidget({super.key});

  @override
  State<CartWidget> createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppPaletteLight.background,
          ),
      child: ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: AppPaletteLight.gray.withOpacity(0.1)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    // Optional: Rounded corners
                    child: Image.asset(
                      ConstantImage.mutton, // Replace with your image URL
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(
                              width: 0.3, color: AppPaletteLight.lightBlack),
                          color: AppPaletteLight.blueColor.withOpacity(0.01)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 2),
                        child: Text(
                          texts.offerApplied,
                          style: context.themeData.textTheme.bodyMedium!
                              .copyWith(
                                  fontSize: 8,
                                  fontWeight: FontWeight.w500,
                                  color: AppPaletteLight.blueColor),
                        ),
                      ),
                    ),
                    Text(
                      "Fress Mutton Birayni  ",
                      maxLines: 2,
                      textAlign: TextAlign.left,
                      style: context.themeData.textTheme.bodyMedium!.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "1 kg",
                      style: context.themeData.textTheme.bodyMedium!.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: AppPaletteLight.gray),
                    ),
                    Text(
                      texts.saveLater,
                      style: context.themeData.textTheme.bodyMedium!.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: AppPaletteLight.lightBlack),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Column(
                  children: [
                    Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 6),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: AppPaletteLight.primary.withOpacity(0.9)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(
                                width: 20,
                                height: 20,
                                child: Icon(
                                  Icons.remove,
                                  size: 20,
                                  color: AppPaletteLight.background,
                                )),
                            SizedBox(
                              width: 20,
                              height: 20,
                              child: Center(
                                child: Text(
                                  "1",
                                  textAlign: TextAlign.center,
                                  style: context.themeData.textTheme.bodyMedium
                                      ?.copyWith(
                                    fontSize: 13,
                                    color: AppPaletteLight.background,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                                width: 20,
                                height: 20,
                                child: Icon(
                                  Icons.add,
                                  size: 20,
                                  color: AppPaletteLight.background,
                                )),
                          ],
                        )),
                    const SizedBox(
                      height: 4,
                    ),
                    Row(
                      children: [
                        Text(
                          "₹349",
                          textAlign: TextAlign.start,
                          maxLines: 1,
                          style: context.themeData.textTheme.bodyMedium?.copyWith(
                            fontSize: 12,
                            color: AppPaletteLight.gray,
                            decoration: TextDecoration.lineThrough,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(
                          "₹299",
                          textAlign: TextAlign.start,
                          maxLines: 1,
                          style: context.themeData.textTheme.bodyMedium?.copyWith(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(
            height: 3,
            color: AppPaletteLight.gradient1,
          );
        },
      ),
    );
  }
}
