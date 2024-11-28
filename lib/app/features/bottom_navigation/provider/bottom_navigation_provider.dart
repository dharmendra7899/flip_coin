import 'package:flutter/material.dart';

class BottomNavigationProvider extends ChangeNotifier {

  bool _showBars = true;
  bool isMicClick = false;
  int _selectedBottomNavigationBarIndex = 0;
  late AnimationController _animationController;
  late Animation<Offset> _animationBottomBarOffset;
  late Animation<Offset> _animationAppBarOffset;

  get getBars=> _showBars;
  get curSlider => _curSlider;

  bool sliderLoading = true;

  int _curSlider = 0;



  AnimationController get animationController => _animationController;

  get animationNavigationBarOffset => _animationBottomBarOffset;

  get animationAppBarBarOffset => _animationAppBarOffset;

  get micClick => isMicClick;

  int get selectedBottomNavigationBarIndex => _selectedBottomNavigationBarIndex;

  set setSelectedBottomNavigationBarIndex(int value) {
    _selectedBottomNavigationBarIndex = value;
    notifyListeners();
  }

  setMicClickBtn(bool value) {
    isMicClick = value;

    notifyListeners();
  }

  showAppAndBottomBars(bool value) {
    _showBars = value;
    notifyListeners();
  }

  void setAnimationController(AnimationController animationController) {
    _animationController = animationController;
    notifyListeners();
  }

  setBottomBarOffsetToAnimateController(
      AnimationController animationController) {
    _animationBottomBarOffset =
        Tween<Offset>(begin: Offset.zero, end: const Offset(0.0, 1.0)).animate(
          CurvedAnimation(
            parent: animationController,
            curve: Curves.easeIn,
          ),
        );
    notifyListeners();
  }

  setAppBarOffsetToAnimateController(AnimationController animationController) {
    _animationAppBarOffset =
        Tween<Offset>(end: const Offset(0.0, -1.25), begin: Offset.zero)
            .animate(
          CurvedAnimation(
            parent: animationController,
            curve: Curves.easeIn,
          ),
        );
    notifyListeners();
  }

  setCurSlider(int pos) {
    _curSlider = pos;
    notifyListeners();
  }











  int _index = 0;

  int get index => _index;

  bool hideBottomNavigationBar = false;



  void onTapped(int i) {
    _index = i;
    notifyListeners();
  }
}
