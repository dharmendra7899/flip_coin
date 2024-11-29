import 'package:flip_coin/app/core/theme/app_palette.dart';
import 'package:flutter/material.dart';

class SortDialog extends StatelessWidget {
  final String title;
  final String initialSortBy;
  final String initialOrderBy;
  final List<Map<String, String>> sortOptions;
  final Function(String sortBy, String orderBy) onSortSelected;

  const SortDialog({
    super.key,
    required this.title,
    required this.initialSortBy,
    required this.initialOrderBy,
    required this.sortOptions,
    required this.onSortSelected,
  });

  @override
  Widget build(BuildContext context) {
    int initialSelectedValue = sortOptions.indexWhere(
            (option) => option['sortBy'] == initialSortBy && option['orderBy'] == initialOrderBy) +
        1;

    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        int selectedValue = initialSelectedValue;

        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom + 20,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 12,),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title,
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
                ),
                const Divider(thickness: 0.9),

                // Sort Options
                ...sortOptions.asMap().entries.map((entry) {
                  int index = entry.key + 1;
                  Map<String, String> option = entry.value;
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          option['label'] ?? '',
                          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 16,
                            color: selectedValue == index
                                ? AppPaletteLight.primary
                                : AppPaletteLight.lightBlack,
                          ),
                        ),
                        Radio<int>(
                          value: index,
                          groupValue: selectedValue,
                          activeColor: AppPaletteLight.primary,
                          onChanged: (int? value) {
                            setState(() {
                              selectedValue = value!;
                            });
                            onSortSelected(option['sortBy']!, option['orderBy']!);
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  );
                }),
              ],
            ),
          ),
        );
      },
    );
  }
}
