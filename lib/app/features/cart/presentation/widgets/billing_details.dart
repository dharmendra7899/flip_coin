import 'package:flip_coin/app/core/custom/app_button.dart';
import 'package:flip_coin/app/core/extensions/context_extension.dart';
import 'package:flip_coin/app/core/helper_function/helper_function.dart';
import 'package:flip_coin/app/core/theme/app_palette.dart';
import 'package:flutter/material.dart';

class BillingDetails extends StatefulWidget {
  const BillingDetails({super.key});

  @override
  State<BillingDetails> createState() => _BillingDetailsState();
}

class _BillingDetailsState extends State<BillingDetails> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.blue.shade50,
              boxShadow: boxShadow()),
          child: Expanded(
            child: Row(
              children: [
                const Icon(
                  Icons.check_circle,
                  color: Colors.blue,
                  size: 40,
                ),
                const SizedBox(width: 8.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Yay! 10% OFF applied!",
                      style: context.themeData.textTheme.bodyMedium?.copyWith(
                        fontSize: 14.0,
                        color: AppPaletteLight.blueColor,
                      ),
                    ),
                    Text(
                      "Offer applied on Home & Kitchen essentials.",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: context.themeData.textTheme.bodyMedium?.copyWith(
                          fontSize: 14.0, color: AppPaletteLight.textColor),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        ClipPath(
          clipper: WaveClipper(),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppPaletteLight.background,
                boxShadow: boxShadow()),
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Bill details",
                  style: context.themeData.textTheme.bodyMedium!
                      .copyWith(fontSize: 18.0, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 8.0),
                _buildRow(
                  "Items total",
                  "₹10,253",
                  "₹6,662",
                  true,
                ),
                _buildRow(
                  "10% off on Home & Kitchen essentials",
                  null,
                  "-₹300",
                  false,
                ),
                _buildRow(
                  "Delivery charge",
                  "₹30",
                  "FREE",
                  false,
                ),
                _buildRow(
                  "Tax",
                  null,
                  "0.5%",
                  false,
                ),
                Divider(
                  thickness: 1,
                  color: Colors.grey.shade300,
                ),
                _buildRow(
                  "Grand total",
                  null,
                  "₹6,371",
                  false,
                  bold: true,
                ),
                const SizedBox(height: 8.0),
                Container(
                  color: Colors.blue.shade50,
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Your total savings",
                        style: context.themeData.textTheme.bodyMedium!
                            .copyWith(color: Colors.blue.shade900),
                      ),
                      Text(
                        "₹3,921",
                        style: context.themeData.textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue.shade900,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRow(
    String title,
    String? oldPrice,
    String newPrice,
    bool isSaved, {
    bool bold = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              title,
              style: context.themeData.textTheme.bodyMedium?.copyWith(
                fontSize: 14.0,
                fontWeight: bold ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ),
          Row(
            children: [
              if (oldPrice != null)
                Text(
                  oldPrice,
                  style: context.themeData.textTheme.bodyMedium?.copyWith(
                    fontSize: 14.0,
                    color: AppPaletteLight.gray,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
              const SizedBox(width: 8.0),
              Text(
                newPrice,
                style: context.themeData.textTheme.bodyMedium?.copyWith(
                  fontSize: 14.0,
                  fontWeight: bold ? FontWeight.bold : FontWeight.normal,
                  color: isSaved
                      ? AppPaletteLight.greenColor
                      : AppPaletteLight.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 20);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 20);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
