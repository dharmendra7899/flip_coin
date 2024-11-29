import 'package:flutter/material.dart';

import 'package:flip_coin/app/core/theme/app_palette.dart';
import 'package:flip_coin/app/core/custom/text.dart';

class BrandFilter extends StatefulWidget {
  final String title;
  final Function(Map<String, List<String>>) onApply; // Callback for selected filters
  final VoidCallback onClearFilters;

  const BrandFilter({
    required this.title,
    required this.onApply,
    required this.onClearFilters,
    Key? key,
  }) : super(key: key);

  @override
  State<BrandFilter> createState() => _BrandFilterState();
}

class _BrandFilterState extends State<BrandFilter> {
  Map<String, List<String>> selectedFilters = {}; // Stores selected filters
  final List<String> brandList = ["Zoff", "Happilo", "Tata", "Mr. Makhana"];
  final Map<String, bool> checkboxStates = {}; // Tracks checkbox states
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize checkbox states for all brands
    for (var brand in brandList) {
      checkboxStates[brand] = false;
    }
  }

  void clearAllFilters() {
    setState(() {
      for (var key in checkboxStates.keys) {
        checkboxStates[key] = false;
      }
      selectedFilters.clear();
    });
    widget.onClearFilters();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 12),
          _buildHeader(context),
          const Divider(thickness: 0.8),
          Expanded(child: _buildContent()),
          const Divider(thickness: 0.9),
          const SizedBox(height: 16),
          _buildActionButtons(context),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.title,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppPaletteLight.black,
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
    );
  }

  Widget _buildContent() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildBrandList(),
        _buildSubList(),
      ],
    );
  }

  Widget _buildBrandList() {
    return Expanded(
      flex: 1,
      child: Container(
        decoration: const BoxDecoration(
          color: AppPaletteLight.surfaceBright,
          boxShadow: [BoxShadow(color: AppPaletteLight.gray)],
        ),
        child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (overscroll) {
            overscroll.disallowIndicator();
            return true;
          },
          child: ListView.builder(
            padding: const EdgeInsetsDirectional.only(top: 10.0),
            itemCount: brandList.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  // Handle brand selection logic if needed
                },
                child: Padding(
                  padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                  child: Text(
                    brandList[index],
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: AppPaletteLight.black,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildSubList() {
    return Expanded(
      flex: 3,
      child: Container(
        color: AppPaletteLight.background,
        child: ListView.builder(
          padding: const EdgeInsets.all(8.0),
          itemCount: brandList.length,
          itemBuilder: (context, index) {
            final item = brandList[index];
            return CheckboxListTile(
              visualDensity: const VisualDensity(vertical: -4),
              contentPadding: EdgeInsets.zero,
              title: Text(
                item,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              value: checkboxStates[item],
              activeColor: AppPaletteLight.primary,
              onChanged: (bool? value) {
                setState(() {
                  checkboxStates[item] = value ?? false;
                  if (value == true) {
                    selectedFilters.update(
                      'brand',
                          (list) => [...list, item],
                      ifAbsent: () => [item],
                    );
                  } else {
                    selectedFilters['brand']?.remove(item);
                  }
                });
              },
            );
          },
        ),
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ElevatedButton(
          onPressed: clearAllFilters,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppPaletteLight.background,
            shape: RoundedRectangleBorder(
              side: const BorderSide(
                color: AppPaletteLight.gray,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 34),
          ),
          child: Text(
            texts.clear,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: AppPaletteLight.textColor,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            widget.onApply(selectedFilters);
            Navigator.of(context).pop();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppPaletteLight.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 34),
          ),
          child: Text(
            texts.apply,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: AppPaletteLight.background,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
