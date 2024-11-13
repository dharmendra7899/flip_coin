import 'package:flutter/material.dart';

horizontalSpace(double width) {
  return SizedBox(
    width: width,
  );
}

verticalSpace(double height) {
  return SizedBox(
    height: height,
  );
}

SliverToBoxAdapter sliverHorizontalSpace(double width) {
  return SliverToBoxAdapter(
    child: SizedBox(
      width: width,
    ),
  );
}

SliverToBoxAdapter sliverVerticalSpace(double height) {
  return SliverToBoxAdapter(
    child: SizedBox(
      height: height,
    ),
  );
}
