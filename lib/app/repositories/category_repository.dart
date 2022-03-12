import 'package:floor/floor.dart';
import '../models/category_model.dart';

@dao
abstract class CategoryRepository {
  @Query('SELECT * FROM categories ORDER BY sort_order ASC')
  Future<List<CategoryModel>> findAllCategory();

  @Query('SELECT * FROM categories')
  Stream<List<CategoryModel>> findAllTasksAsStream();

  @Query('SELECT * FROM categories WHERE id = :id')
  Future<CategoryModel?> findCategoryById(int id);

  @insert
  Future<void> insertCategory(CategoryModel category);

  @Update(onConflict: OnConflictStrategy.replace)
  Future<void> updateCategory(CategoryModel category);

  @update
  Future<int> updateCategories(List<CategoryModel> categories);

  @delete
  Future<void> deleteCategory(CategoryModel category);

  @delete
  Future<int> deletePersons(List<CategoryModel> categories);
}
