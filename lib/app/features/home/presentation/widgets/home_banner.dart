import 'package:flip_coin/app/core/custom/custom_image_view.dart';
import 'package:flip_coin/app/core/theme/app_palette.dart';
import 'package:flip_coin/app/features/bottom_navigation/provider/bottom_navigation_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class CustomSlider extends StatefulWidget {
  const CustomSlider({super.key, this.height = 180});

  final double height;

  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  final _controller = PageController();

  final List<String> homeSliderList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) => _animateSlider());
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          SizedBox(
            height: widget.height,
            width: double.infinity,
            child: PageView.builder(
              itemCount: homeSliderList.length,
              controller: _controller,
              onPageChanged: (index) {
                context.read<BottomNavigationProvider>().setCurSlider(index);
              },
              itemBuilder: (context, index) {
                return buildImagePageItem(homeSliderList[index]);
              },
            ),
          ),
          _showSliderPosition()
        ],
      ),
    );
  }

  static Widget sliderLoading(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = width / 2;
    return Shimmer.fromColors(
      baseColor: AppPaletteLight.gray,
      highlightColor: AppPaletteLight.gradient1,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        width: double.infinity,
        height: height,
        color: AppPaletteLight.background,
      ),
    );
  }

  void _animateSlider() {
    Future.delayed(const Duration(seconds: 5), () {
      if (!mounted || !_controller.hasClients) return;

      int nextPage = _controller.page!.round() + 1;
      if (nextPage == homeSliderList.length) {
        nextPage = 0;
      }

      _controller
          .animateToPage(
            nextPage,
            duration: const Duration(milliseconds: 200),
            curve: Curves.linear,
          )
          .then((_) => _animateSlider());
    });
  }

  Widget buildImagePageItem(String slider) {
    return GestureDetector(
      onTap: () {},
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: CustomImage(
          image: slider,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _showSliderPosition() {
    return Selector<BottomNavigationProvider, int>(
      selector: (_, slider) => slider.curSlider,
      builder: (context, curSliderIndex, _) {
        final sliderList = homeSliderList;

        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(sliderList.length, (index) {
            return AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              width: curSliderIndex == index ? 8.0 : 6.0,
              height: curSliderIndex == index ? 8.0 : 6.0,
              margin:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: curSliderIndex == index
                    ? AppPaletteLight.primary
                    : AppPaletteLight.gray,
              ),
            );
          }),
        );
      },
    );
  }
}
