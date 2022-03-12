import 'package:beplan/database.dart';
import 'package:get/get.dart';

import 'package:beplan/app/models/category_model.dart';
import 'controller.dart';

class CategoryController extends BaseController {
  final _categoryList = Future.value(<CategoryModel>[]).obs;
  Future<List<CategoryModel>> get categoryList => _categoryList.value;
  set categoryList(value) => _categoryList.value = Future.value(value);

  final _isCategoryLoaderShow = false.obs;
  bool get isCategoryLoaderShow => _isCategoryLoaderShow.value;
  set isCategoryLoaderShow(value) => _isCategoryLoaderShow.value = value;

  @override
  Future<void> onInit() async {
    super.onInit();
    dbConnection = await connection();
    getAllCategories();
  }

  Future<void> getAllCategories() async {
    dbConnection?.categoryRepository.findAllCategory().then((value) {
      categoryList = value;
      isCategoryLoaderShow = true;
      update();
    });
  }

  Future<void> storeCategory(String name) async {
    dbConnection?.categoryRepository
        .insertCategory(CategoryModel(name, 999))
        .then((value) {
      getAllCategories();
    });
  }

  void updateSortOrderCategory(CategoryModel updateCategoryEntity) {
    dbConnection!.categoryRepository.updateCategory(updateCategoryEntity);
  }
}
