import 'package:beplan/app/controllers/category_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class CategoryCreateFormView extends StatefulWidget {
  const CategoryCreateFormView({Key? key}) : super(key: key);

  @override
  State<CategoryCreateFormView> createState() => _CategoryCreateFormViewState();
}

class _CategoryCreateFormViewState extends State<CategoryCreateFormView> {
  late String categoryName;
  final CategoryController controller = Get.find();
  final _categoryCreateFormViewState = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedPadding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      duration: const Duration(milliseconds: 50),
      child: Material(
        child: SafeArea(
          top: true,
          child: Container(
            margin: const EdgeInsets.all(32),
            child: Form(
              key: _categoryCreateFormViewState,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    child: Text('Add New Category'.tr,
                        style: Theme.of(context).textTheme.headline5),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 0,
                      vertical: 16,
                    ),
                    child: TextFormField(
                      autocorrect: false,
                      validator: (text) {
                        if (text!.isEmpty) {
                          return 'Category name cannot be empty'.tr;
                        } else if (text.length < 3 && text.isNotEmpty) {
                          return 'Category name must be greater than 3 letters.'
                              .tr;
                        }
                        return null;
                      },
                      onChanged: (text) {
                        setState(() {
                          categoryName = text;
                        });
                      },
                      decoration: InputDecoration(
                        hintText: 'Category Name'.tr,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _saveCategory,
                      child: Text('Save'.tr.toUpperCase()),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _saveCategory() {
    final isValid = _categoryCreateFormViewState.currentState?.validate();

    if (!isValid!) {
      return null;
    }

    EasyLoading.show();
    controller.storeCategory(categoryName).then((value) {
      Get.back();
      EasyLoading.dismiss();
    }).onError((error, stackTrace) {
      EasyLoading.dismiss();
    });
  }
}
