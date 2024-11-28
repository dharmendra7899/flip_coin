import 'package:flip_coin/app/core/assets/constant_images.dart';
import 'package:flutter/material.dart';

class CategoryProvider extends ChangeNotifier {
  bool catLoading = false;

  final List<String> catList = [
        ConstantImage.egg,
        ConstantImage.bir,
        ConstantImage.chick,
        ConstantImage.bir,
        ConstantImage.chick,
        ConstantImage.download,
        ConstantImage.egg,
        ConstantImage.download,
        ConstantImage.egg,
        ConstantImage.bir,
        ConstantImage.chick,
        ConstantImage.bir,
        ConstantImage.chick,
        ConstantImage.download,
        ConstantImage.egg,
        ConstantImage.download,
      ],
      popularList = [];

  List<String>? _subList = [
    ConstantImage.egg,
    ConstantImage.bir,
    ConstantImage.chick,
    ConstantImage.bir,
    ConstantImage.chick,
    ConstantImage.download,
    ConstantImage.egg,
    ConstantImage.download,
    ConstantImage.egg,
    ConstantImage.bir,
    ConstantImage.chick,
    ConstantImage.bir,
    ConstantImage.chick,
    ConstantImage.download,
    ConstantImage.egg,
    ConstantImage.download,
  ];
  int _curCat = 0;

  get subList => _subList;

  get curCat => _curCat;

  setCurSelected(int index) {
        _curCat = index;
        notifyListeners();
  }

  setSubList(List<String>? subList) {
        _subList = subList;
        notifyListeners();
  }
}
