import 'package:flip_coin/app/core/theme/app_palette.dart';
import 'package:flutter/material.dart';

class SliverDivider extends StatelessWidget {
  const SliverDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        height: 10,
        color: AppPaletteLight.surfContainerLow,
      ),
    );
  }
}
