import 'package:flutter/material.dart';

class BannerSlider extends StatelessWidget {
  const BannerSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: PageView(
        children: [
          Image.asset('assets/images/dummy1.jpeg', fit: BoxFit.cover),
          Image.asset('assets/images/dummy2.jpeg', fit: BoxFit.cover),
          Image.asset('assets/images/dummy3.jpeg', fit: BoxFit.cover),
        ],
      ),
    );
  }
}
