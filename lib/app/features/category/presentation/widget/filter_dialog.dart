import 'package:flip_coin/app/core/custom/text.dart';
import 'package:flip_coin/app/core/theme/app_palette.dart';
import 'package:flutter/material.dart';

class FilterBottomSheet extends StatelessWidget {
  final RangeValues initialPriceRange;
  final List<String> brands;
  final List<String> weights;
  final List<String> variants;
  final Function(RangeValues priceRange, Set<String> selectedBrands,
      Set<String> selectedWeights, Set<String> selectedVariants) onApply;

  const FilterBottomSheet({super.key,
    required this.initialPriceRange,
    required this.brands,
    required this.weights,
    required this.variants,
    required this.onApply,
  });

  @override
  Widget build(BuildContext context) {
    return FilterBottomSheetContent(
      initialPriceRange: initialPriceRange,
      brands: brands,
      weights: weights,
      variants: variants,
      onApply: onApply,
    );
  }
}

class FilterBottomSheetContent extends StatefulWidget {
  final RangeValues initialPriceRange;
  final List<String> brands;
  final List<String> weights;
  final List<String> variants;
  final Function(RangeValues priceRange, Set<String> selectedBrands,
      Set<String> selectedWeights, Set<String> selectedVariants) onApply;

  const FilterBottomSheetContent({super.key,
    required this.initialPriceRange,
    required this.brands,
    required this.weights,
    required this.variants,
    required this.onApply,
  });

  @override
  _FilterBottomSheetContentState createState() =>
      _FilterBottomSheetContentState();
}

class _FilterBottomSheetContentState extends State<FilterBottomSheetContent> {
  late RangeValues priceRange;
  Set<String> selectedBrands = {};
  Set<String> selectedWeights = {};
  Set<String> selectedVariants = {};

  @override
  void initState() {
    super.initState();
    priceRange = widget.initialPriceRange;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          top: 20,
          left: 16,
          right: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  texts.filter,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color:AppPaletteLight.black,
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(
                    Icons.close,
                    color: AppPaletteLight.black.withOpacity(0.6),
                  ),
                ),
              ],
            ),
            const Divider(thickness: 0.9),
            const SizedBox(height: 16),
            _buildPriceRangeSlider(),
            const SizedBox(height: 16),
            _buildChipsSection(
              title: "Brands",
              items: widget.brands,
              selectedItems: selectedBrands,
            ),
            const SizedBox(height: 16),
            _buildChipsSection(
              title: "Weights",
              items: widget.weights,
              selectedItems: selectedWeights,
            ),
            const SizedBox(height: 16),
            _buildChipsSection(
              title: "Variants",
              items: widget.variants,
              selectedItems: selectedVariants,
            ),
            const SizedBox(height: 16),
            const Divider(thickness: 0.9),
            const SizedBox(height: 16),
            _buildActionButtons(context),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildPriceRangeSlider() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Price Range (₹${priceRange.start.toInt()} - ₹${priceRange.end.toInt()})",
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: AppPaletteLight.textColor, fontSize: 16),
        ),
        RangeSlider(
          values: priceRange,
          min: 100,
          max: 2000,
          divisions: 19,

          activeColor: AppPaletteLight.primary,
          inactiveColor: AppPaletteLight.lightBlack,
          labels: RangeLabels(
            "₹${priceRange.start.toInt()}",
            "₹${priceRange.end.toInt()}",
          ),
          onChanged: (RangeValues values) {
            setState(() {
              priceRange = values;
            });
          },
        ),
      ],
    );
  }

  Widget _buildChipsSection({
    required String title,
    required List<String> items,
    required Set<String> selectedItems,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: AppPaletteLight.textColor, fontSize: 16),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          children: items
              .map(
                (item) => FilterChip(
                  label: Text(item),
                  selected: selectedItems.contains(item),
                  onSelected: (isSelected) {
                    setState(() {
                      if (isSelected) {
                        selectedItems.add(item);
                      } else {
                        selectedItems.remove(item);
                      }
                    });
                  },
                ),
              )
              .toList(),
        ),
      ],
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [

        ElevatedButton(
          onPressed: () {
            setState(() {
              priceRange = widget.initialPriceRange;
              selectedBrands.clear();
              selectedWeights.clear();
              selectedVariants.clear();
            });
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppPaletteLight.background, // Set button color
            shape: RoundedRectangleBorder(
              side: const BorderSide(
                color: AppPaletteLight.gray, // Border color
                width: 2, // Border width
              ),
              borderRadius:
              BorderRadius.circular(8), // Set button corner radius
            ),
            padding: const EdgeInsets.symmetric(
                vertical: 12, horizontal: 34), // Optional: Adjust padding
          ),
          child: Text(
            texts.clear,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: AppPaletteLight.textColor, fontSize: 16,fontWeight: FontWeight.w500),
          ),
        ),

        ElevatedButton(
          onPressed: () {
            widget.onApply(
              priceRange,
              selectedBrands,
              selectedWeights,
              selectedVariants,
            );
            Navigator.of(context).pop();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppPaletteLight.primary, // Set button color
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(8), // Set button corner radius
            ),
            padding: const EdgeInsets.symmetric(
                vertical: 12, horizontal: 34), // Optional: Adjust padding
          ),
          child: Text(
            texts.apply,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: AppPaletteLight.background, fontSize: 16,fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }
}
