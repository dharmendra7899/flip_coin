import 'package:flip_coin/app/core/custom/text.dart';
import 'package:flip_coin/app/core/extensions/context_extension.dart';
import 'package:flip_coin/app/core/helper_function/helper_function.dart';
import 'package:flip_coin/app/core/theme/app_palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SpeciExtraBtnDetails extends StatelessWidget {
  const SpeciExtraBtnDetails({
    super.key,
  });

  getImageWithHeading(String image, String heading, BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(
        start: 7.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: const EdgeInsetsDirectional.only(bottom: 5.0),
            child: ClipRRect(
              child: SvgPicture.asset(
                DesignConfiguration.setSvgPath(image),
                height: 32.0,
                width: 32.0,
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    AppPaletteLight.textColor.withOpacity(0.7),
                    BlendMode.srcIn),
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width * (0.22),
            child: Text(
              heading,
              textAlign: TextAlign.center,
              maxLines: 3,
              style: context.themeData.textTheme.bodySmall?.copyWith(
                fontSize: 12,
                fontStyle: FontStyle.normal,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppPaletteLight.background,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        child: Row(
          children: [
            Expanded(
              child: getImageWithHeading(
                'cod',
                texts.cod,
                context,
              ),
            ),
            Expanded(
              child: getImageWithHeading(
                'cancelable',
                texts.cancel,
                context,
              ),
            ),
            Expanded(
              child: getImageWithHeading(
                'returnable',
                texts.returnable,
                context,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ReviewWidget extends StatelessWidget {
  int? secPos;
  int? widgetindex;

  ReviewWidget({super.key, this.secPos, this.widgetindex});

  _reviewTitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 5,
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              'Product Ratings & Reviews',
              style: context.themeData.textTheme.bodyMedium?.copyWith(
                  fontSize: 16,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w500,
                  color: AppPaletteLight.lightBlack),
            ),
          ),
          InkWell(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                texts.viewAll,
                style: const TextStyle(color: AppPaletteLight.primary),
              ),
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppPaletteLight.background,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _reviewTitle(context),
          Padding(
            padding: const EdgeInsets.only(
              right: 15.0,
              left: 15,
              top: 19,
              bottom: 5,
            ),
            child: Text(
              "Real images from customers",
              style: context.themeData.textTheme.bodyMedium?.copyWith(
                  fontSize: 12,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w500,
                  color: AppPaletteLight.black),
              textAlign: TextAlign.left,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 8.0, left: 8.0),
            child: Divider(
              height: 0,
            ),
          ),
        ],
      ),
    );
  }
}
