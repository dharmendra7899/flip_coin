import 'package:flip_coin/app/core/custom/app_button.dart';
import 'package:flip_coin/app/core/extensions/context_extension.dart';
import 'package:flip_coin/app/core/helper_function/helper_function.dart';
import 'package:flip_coin/app/core/theme/app_palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddressList extends StatelessWidget {
  final String label;
  final String address;
  final String phone;
  final String distance;

  const AddressList({
    required this.label,
    required this.address,
    required this.phone,
    required this.distance,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: AppPaletteLight.background,
            boxShadow: boxShadow()),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 30,
              width: 30,
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppPaletteLight.background),
              child: SvgPicture.asset(
                DesignConfiguration.setSvgPath('sel_home'),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: context.themeData.textTheme.bodyMedium?.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(address,
                      style: context.themeData.textTheme.bodyMedium?.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      )),
                  const SizedBox(height: 4),
                  Text('Phone number: $phone',
                      style: context.themeData.textTheme.bodyMedium?.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      )),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Edit',
                          style:
                              context.themeData.textTheme.bodyMedium?.copyWith(
                            fontSize: 12,
                            color: AppPaletteLight.greenColor,
                            fontWeight: FontWeight.w600,
                          )),
                      const SizedBox(
                        width: 20,
                      ),
                      Text('Delete',
                          style:
                              context.themeData.textTheme.bodyMedium?.copyWith(
                            fontSize: 12,
                            color: AppPaletteLight.redColor,
                            fontWeight: FontWeight.w600,
                          )),
                    ],
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
