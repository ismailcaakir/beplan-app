import 'package:floor/floor.dart';

import 'base_model.dart';

@Entity(tableName: 'categories')
class CategoryModel extends BaseModel {
  @ColumnInfo(name: "name")
  final String name;

  @ColumnInfo(name: "sort_order")
  final int sortOrder;

  CategoryModel(
    this.name,
    this.sortOrder, {
    int? id,
    String? createTime,
    String? updateTime,
  }) : super(id, updateTime: updateTime, createTime: createTime);
}
