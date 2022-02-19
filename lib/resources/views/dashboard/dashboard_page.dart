import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/controllers/dashboard_controller.dart';

class DashboardPage extends GetView<DashboardController> with RouteAware {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        onPageChanged: _onPageChanged,
        physics: const ScrollPhysics(parent: NeverScrollableScrollPhysics()),
        children: [
          Scaffold(
            body: Text("asd"),
          ),
          Scaffold(
            body: Text("asd"),
          ),
          Scaffold(
            body: Text("asd"),
          )
        ],
        controller: controller.pageController,
      ),
      bottomNavigationBar: buildBottomNavigationMenu(context, controller),
    );
  }

  buildBottomNavigationMenu(context, landingPageController) {
    return Obx(
      () {
        return BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.safety_divider),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.safety_divider),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.safety_divider),
              label: '',
            ),
          ],
          currentIndex: controller.currentIndex.toInt(),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedFontSize: 14,
          unselectedFontSize: 14,
          type: BottomNavigationBarType.fixed,
          iconSize: 25,
          onTap: _onItemTapped,
        );
      },
    );
  }

  void _onItemTapped(int value) {
    controller.pageController.jumpToPage(value);
  }

  void _onPageChanged(int value) {}
}
