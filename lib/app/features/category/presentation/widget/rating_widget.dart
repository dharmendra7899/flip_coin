import 'package:flip_coin/app/core/extensions/context_extension.dart';
import 'package:flip_coin/app/core/helper_function/helper_function.dart';
import 'package:flip_coin/app/core/theme/app_palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GetRatingWidget extends StatelessWidget {
  String ratting;
  String noOfRatting;

  GetRatingWidget(
      {super.key, required this.noOfRatting, required this.ratting});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsetsDirectional.only(
              start: 15.0,
              end: 5.0,
              top: 15.0,
              bottom: 15.0,
            ),
            child: starRatingProductDetailPage(
              ratting,
              noOfRatting,
              true,
              context,
            ),
          ),
        ),
      ],
    );
  }

  getSVGImage(String svg) {
    return Padding(
      padding: const EdgeInsets.only(right: 5.0),
      child: SvgPicture.asset(
        DesignConfiguration.setSvgPath(svg),
        height: 14,
        width: 14,
      ),
    );
  }

  getHalfStar(String value) {
    return value == '1' || value == '2' || value == '3'
        ? getSVGImage('d_star')
        : value == '4' || value == '5' || value == '6'
            ? getSVGImage('c_star')
            : value == '7' || value == '8' || value == '9'
                ? getSVGImage('b_star')
                : getSVGImage('e_star');
  }

  Widget starRatingProductDetailPage(String totalRating, String noOfRatings,
      bool needToShowNoOfRatings, BuildContext context) {
    return Row(
      children: [
        for (int i = 0; i < 5; i++)
          totalRating[0] == '0'
              ? getHalfStar('emptystar')
              : totalRating[0] == '1'
                  ? i == 0
                      ? getSVGImage('a_star')
                      : i == 1
                          ? getHalfStar(totalRating[2])
                          : getHalfStar('emptystar')
                  : totalRating[0] == '2'
                      ? i < 2
                          ? getSVGImage('a_star')
                          : i == 2
                              ? getHalfStar(totalRating[2])
                              : getHalfStar('emptystar')
                      : totalRating[0] == '3'
                          ? i < 3
                              ? getSVGImage('a_star')
                              : i == 3
                                  ? getHalfStar(totalRating[2])
                                  : getHalfStar('emptystar')
                          : totalRating[0] == '4'
                              ? i < 4
                                  ? getSVGImage('a_star')
                                  : i == 4
                                      ? getHalfStar(totalRating[2])
                                      : getHalfStar('emptystar')
                              : totalRating[0] == '5'
                                  ? getSVGImage('a_star')
                                  : const SizedBox(),
        const SizedBox(
          width: 5.0,
        ),
        Flexible(
          child: Text(
            totalRating,
            style: context.themeData.textTheme.bodySmall?.copyWith(
              fontSize: 14,
              color: AppPaletteLight.black,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.normal,
            ),
          ),
        ),
        needToShowNoOfRatings
            ? const SizedBox(
                width: 8.0,
              )
            : const SizedBox(),
        needToShowNoOfRatings
            ? Flexible(
                child: Text(
                  '|  $noOfRatings Ratings',
                  style: context.themeData.textTheme.bodySmall?.copyWith(
                    fontSize: 12,
                    color: AppPaletteLight.lightBlack,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}
