import 'controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardController extends BaseController {
  late PageController pageController;
  var currentIndex = 0.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    pageController = PageController(initialPage: 0, keepPage: false);
    pageController.addListener(_pageControllerListener);
    // _sendAnalyticsScreenName(0);
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  void _pageControllerListener() {
    currentIndex.value = pageController.page!.toInt();

    // _sendAnalyticsScreenName(currentIndex.value);
  }
}
