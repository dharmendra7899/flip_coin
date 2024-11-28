import 'dart:ui';

import 'package:flip_coin/app/core/custom/text.dart';
import 'package:flip_coin/app/core/theme/app_palette.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class ProductPreview extends StatefulWidget {
  final int? pos, index;
  final bool? list, from;
  final String? id;

  final List<String?>? imgList;

  const ProductPreview({
    super.key,
    this.pos,
    this.index,
    this.list,
    this.id,
    this.imgList,
    this.from,
  });

  @override
  State<StatefulWidget> createState() => StatePreview();
}

class StatePreview extends State<ProductPreview> {
  int? curPos;
  PageController? _pageController;

  @override
  void initState() {
    super.initState();

    curPos = widget.pos;
    _pageController = PageController(initialPage: widget.pos!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Hero(
        tag: widget.list!
            ? '$texts.heroTagUniqueString${widget.id}'
            : '$texts.heroTagUniqueString${widget.imgList}${widget.index}',
        child: Stack(
          children: <Widget>[
            PhotoViewGallery.builder(
              scrollPhysics: const BouncingScrollPhysics(),
              builder: (BuildContext context, int index) {
                return PhotoViewGalleryPageOptions(
                    initialScale: PhotoViewComputedScale.contained,
                    minScale: PhotoViewComputedScale.contained * 0.9,
                    imageProvider: AssetImage(
                      widget.imgList![index]!,
                    ) /*NetworkImage(widget.imgList![index]!)*/);
              },
              itemCount: widget.imgList!.length,
              loadingBuilder: (context, event) => Center(
                child: SizedBox(
                  width: 20.0,
                  height: 20.0,
                  child: CircularProgressIndicator(
                    value: event == null
                        ? 0
                        : event.cumulativeBytesLoaded /
                            event.expectedTotalBytes!,
                  ),
                ),
              ),
              backgroundDecoration:
                  const BoxDecoration(color: AppPaletteLight.background),
              pageController: _pageController,
              onPageChanged: (index) {
                if (mounted) {
                  setState(() {
                    curPos = index;
                  });
                }
              },
            ),

            //
            //Back button
            iOSRundedButton(context),
            curPos != 0
                ? Positioned.directional(
                    start: 10,
                    top: MediaQuery.of(context).size.height * 0.45,
                    textDirection: Directionality.of(context),
                    child: ClipRRect(
                      clipBehavior: Clip.hardEdge,
                      child: BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaX: 10.0,
                          sigmaY: 10.0,
                        ),
                        child: Container(
                          height: 60,
                          width: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: Colors.white.withOpacity(0.5),
                          ),
                          child: Center(
                            child: IconButton(
                              icon: const Icon(Icons.arrow_back_ios_outlined),
                              onPressed: () {
                                setState(
                                  () {
                                    _pageController!.animateToPage(
                                      (curPos! - 1),
                                      duration:
                                          const Duration(milliseconds: 200),
                                      curve: Curves.linear,
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                : const SizedBox(),
            curPos != (widget.imgList!.length - 1)
                ? Positioned.directional(
                    textDirection: Directionality.of(context),
                    end: 10,
                    top: MediaQuery.of(context).size.height * 0.45,
                    child: ClipRRect(
                      clipBehavior: Clip.hardEdge,
                      child: BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaX: 10.0,
                          sigmaY: 10.0,
                        ),
                        child: Container(
                          height: 60,
                          width: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: Colors.white.withOpacity(0.5),
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.arrow_forward_ios_outlined),
                            onPressed: () {
                              setState(
                                () {
                                  _pageController!.animateToPage(
                                    (curPos! + 1),
                                    duration: const Duration(milliseconds: 200),
                                    curve: Curves.linear,
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  )
                : const SizedBox(),
            Positioned.directional(
              textDirection: Directionality.of(context),
              bottom: 10.0,
              start: 25.0,
              end: 25.0,
              child: SelectedPhoto(
                numberOfDots: widget.imgList!.length,
                photoIndex: curPos,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget iOSRundedButton(BuildContext context) {
    return Positioned.directional(
      textDirection: Directionality.of(context),
      top: 39.0,
      start: 11.0,
      child: Material(
        color: Colors.transparent,
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  color: Color(0x1a0400ff),
                  offset: Offset(0, 0),
                  blurRadius: 30,
                )
              ],
              color: AppPaletteLight.background,
              borderRadius: BorderRadius.circular(7),
            ),
            width: 33,
            height: 33,
            alignment: Alignment.center,
            child: InkWell(
              onTap: () => Navigator.of(context).pop(),
              child: const Icon(Icons.arrow_back,
                  color: AppPaletteLight.textColor),
            ),
          ),
        ),
      ),
    );
  }
}

class SelectedPhoto extends StatelessWidget {
  final int? numberOfDots;
  final int? photoIndex;

  const SelectedPhoto({
    super.key,
    this.numberOfDots,
    this.photoIndex,
  });

  Widget _inactivePhoto() {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 3.0, end: 3.0),
      child: Container(
        height: 8.0,
        width: 8.0,
        decoration: BoxDecoration(
          color: AppPaletteLight.primary.withOpacity(0.4),
          borderRadius: BorderRadius.circular(7),
        ),
      ),
    );
  }

  Widget _activePhoto() {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 5.0, end: 5.0),
      child: Container(
        height: 10.0,
        width: 10.0,
        decoration: BoxDecoration(
          color: AppPaletteLight.primary,
          borderRadius: BorderRadius.circular(7),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              spreadRadius: 0.0,
              blurRadius: 2.0,
            )
          ],
        ),
      ),
    );
  }

  List<Widget> _buildDots() {
    List<Widget> dots = [];
    for (int i = 0; i < numberOfDots!; i++) {
      dots.add(
        i == photoIndex ? _activePhoto() : _inactivePhoto(),
      );
    }
    return dots;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: _buildDots(),
      ),
    );
  }
}
