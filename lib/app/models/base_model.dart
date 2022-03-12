import 'package:floor/floor.dart';

class BaseModel {
  @PrimaryKey(autoGenerate: true)
  final int? id;

  @ColumnInfo(name: 'create_time')
  final String createTime;

  @ColumnInfo(name: 'update_time')
  final String updateTime;

  BaseModel(
    this.id, {
    updateTime,
    createTime,
  })  : createTime = createTime ?? DateTime.now().toString(),
        updateTime = updateTime ?? DateTime.now().toString();

  @override
  List<Object> get props => [];
}
