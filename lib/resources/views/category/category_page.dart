import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/controllers/tasks_controller.dart';
import './category_view.dart';

class CategoryPage extends GetView<TasksController> {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TasksController>(
      init: TasksController(),
      builder: (_) {
        return Scaffold(
          appBar: getAppBar(),
          body: CategoryPageView(),
        );
      },
    );
  }

  AppBar getAppBar() {
    return AppBar(
      title: Text('Categories'.tr),
      centerTitle: false,
      actions: [
        IconButton(
          onPressed: () => {},
          icon: const Icon(
            Icons.add_box,
            color: Colors.blueAccent,
          ),
        ),
      ],
    );
  }

  void handleClick(String value) {}
}
