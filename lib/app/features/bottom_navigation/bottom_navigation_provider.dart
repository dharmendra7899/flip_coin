import 'package:flutter/material.dart';

class BottomNavigationProvider extends ChangeNotifier {
  int _index = 0;

  int get index => _index;

  bool hideBottomNavigationBar = false;

  void onTapped(int i) {
    _index = i;
    notifyListeners();
  }
}
