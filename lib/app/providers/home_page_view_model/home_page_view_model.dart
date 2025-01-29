import 'package:flutter/material.dart';

class HomePageViewModel extends ChangeNotifier {
  int selectedIndex = 0;
  final PageController pageController = PageController();

  void onPageChange(int index) {
    selectedIndex = index;
    pageController.jumpToPage(index);
    notifyListeners();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
