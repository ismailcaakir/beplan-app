import 'package:beplan/resources/views/tasks/tasks_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/controllers/dashboard_controller.dart';
import '../tasks/tasks_page.dart';

class DashboardPage extends GetView<DashboardController> with RouteAware {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        onPageChanged: _onPageChanged,
        physics: const ScrollPhysics(parent: NeverScrollableScrollPhysics()),
        children: [
          TasksPage(),
          TasksPage(),
          TasksPage(),
          TasksPage(),
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
              icon: const Icon(Icons.task),
              label: 'Tasks'.tr,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.calendar_today_sharp),
              label: 'Calendar'.tr,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.person_pin),
              label: 'Profile'.tr,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.settings),
              label: 'Settings'.tr,
            ),
          ],
          currentIndex: controller.currentIndex.toInt(),
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
