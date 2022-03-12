import 'package:beplan/app/controllers/category_controller.dart';
import 'package:beplan/app/models/category_model.dart';
import 'package:beplan/config/colors.dart';
import 'package:beplan/resources/components/widgets/loader.dart';
import 'package:beplan/resources/components/widgets/no_entity_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryPageView extends StatefulWidget {
  const CategoryPageView({Key? key}) : super(key: key);

  @override
  State<CategoryPageView> createState() => _CategoryPageViewState();
}

class _CategoryPageViewState extends State<CategoryPageView> {
  final CategoryController controller = Get.find();
  final int newIndex = 99999;

  @override
  Widget build(BuildContext context) {
    if (!controller.isCategoryLoaderShow) {
      return const LoaderWidget();
    }

    return FutureBuilder<List<CategoryModel>>(
      future: controller.categoryList,
      builder:
          (BuildContext context, AsyncSnapshot<List<CategoryModel>> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data!.isNotEmpty) {
            return ReorderableListView(
              onReorder: (int oldIndex, int newIndex) {
                setState(() {
                  if (newIndex > oldIndex) {
                    newIndex -= 1;
                  }
                  final item = snapshot.data!.removeAt(oldIndex);
                  var updateCategoryEntity = CategoryModel(
                    item.name,
                    newIndex + 1,
                    id: item.id,
                    createTime: item.createTime,
                    updateTime: item.updateTime,
                  );
                  controller.updateSortOrderCategory(updateCategoryEntity);
                  snapshot.data!.insert(newIndex, item);
                });
              },
              children: List.generate(
                snapshot.data!.length,
                (index) {
                  return ListTile(
                    leading: Container(
                      decoration: BoxDecoration(
                        color: AppColors.blue.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      width: 50,
                      height: 50,
                      alignment: Alignment.center,
                      child: Text(
                        index.toString(),
                        style: TextStyle(
                          color: AppColors.white,
                        ),
                      ),
                    ),
                    minLeadingWidth: 30,
                    subtitle: Text('deneme'),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.more_vert,
                      ),
                    ),
                    key: Key(
                      snapshot.data![index].id.toString(),
                    ),
                    title: Text(
                      snapshot.data![index].name,
                    ),
                  );
                },
              ).toList(),
            );
          } else {
            return const NoEntityWidget(
              text: "Didn't Create a Category",
              subtext: "Create a new category",
            );
          }
        } else if (snapshot.hasError) {
          return NoEntityWidget(
            text: "Whooopss",
            subtext: snapshot.error.toString(),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
