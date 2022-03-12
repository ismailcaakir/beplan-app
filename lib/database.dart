import 'dart:async';

import 'package:floor/floor.dart';

import 'app/repositories/category_repository.dart';
import 'app/models/category_model.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'database.g.dart'; // the generated code will be there

@Database(version: 1, entities: [CategoryModel])
abstract class AppDatabase extends FloorDatabase {
  CategoryRepository get categoryRepository;
}
