import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/controllers/tasks_controller.dart';
import '../../../config/config.dart';
import './tasks_view.dart';

class TasksPage extends GetView<TasksController> {
  const TasksPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TasksController>(
      init: TasksController(),
      builder: (_) {
        return Scaffold(
          appBar: getAppBar(),
          body: TasksPageView(),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              // Add your onPressed code here!
            },
            child: const Icon(
              Icons.add_circle,
            ),
          ),
        );
      },
    );
  }

  AppBar getAppBar() {
    return AppBar(
      title: Text('Tasks'.tr),
      centerTitle: false,
      actions: [
        IconButton(
          onPressed: () => {},
          icon: const Icon(
            Icons.search,
          ),
        ),
        PopupMenuButton<String>(
          icon: const Icon(Icons.more_vert),
          onSelected: handleMoreActionsClick,
          itemBuilder: (BuildContext context) {
            return {
              'Category Setting',
              'Ready Templates',
              'BePlan Pro',
              'Support',
            }.map((String choice) {
              return PopupMenuItem<String>(
                value: choice,
                child: Text(choice.tr),
              );
            }).toList();
          },
        ),
      ],
    );
  }

  void handleMoreActionsClick(String value) {
    switch (value) {
      case "Category Setting":
        Get.toNamed(RoutesConfig.categoryPage);
        break;
      default:
    }
  }
}
