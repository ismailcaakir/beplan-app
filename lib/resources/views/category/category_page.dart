import 'package:beplan/config/colors.dart';
import 'package:beplan/resources/views/category/components/category_create_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:beplan/app/controllers/category_controller.dart';
import 'package:beplan/resources/views/category/category_view.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class CategoryPage extends GetView<CategoryController> {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoryController>(
      init: CategoryController(),
      builder: (_) {
        return Scaffold(
          appBar: getAppBar(context),
          body: CategoryPageView(),
        );
      },
    );
  }

  AppBar getAppBar(BuildContext context) {
    return AppBar(
      title: Text('Categories'.tr),
      centerTitle: false,
      actions: [
        IconButton(
          onPressed: () {
            showBarModalBottomSheet(
              expand: false,
              context: context,
              backgroundColor: AppColors.transparent,
              builder: (context) => CategoryCreateFormView(),
            );
          },
          icon: Icon(
            Icons.add_box,
            color: AppColors.blue.withOpacity(0.7),
          ),
        ),
      ],
    );
  }

  void handleClick(String value) {}
}
