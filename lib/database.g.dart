// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  CategoryRepository? _categoryRepositoryInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `categories` (`name` TEXT NOT NULL, `sort_order` INTEGER NOT NULL, `id` INTEGER PRIMARY KEY AUTOINCREMENT, `create_time` TEXT NOT NULL, `update_time` TEXT NOT NULL)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  CategoryRepository get categoryRepository {
    return _categoryRepositoryInstance ??=
        _$CategoryRepository(database, changeListener);
  }
}

class _$CategoryRepository extends CategoryRepository {
  _$CategoryRepository(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _categoryModelInsertionAdapter = InsertionAdapter(
            database,
            'categories',
            (CategoryModel item) => <String, Object?>{
                  'name': item.name,
                  'sort_order': item.sortOrder,
                  'id': item.id,
                  'create_time': item.createTime,
                  'update_time': item.updateTime
                },
            changeListener),
        _categoryModelUpdateAdapter = UpdateAdapter(
            database,
            'categories',
            ['id'],
            (CategoryModel item) => <String, Object?>{
                  'name': item.name,
                  'sort_order': item.sortOrder,
                  'id': item.id,
                  'create_time': item.createTime,
                  'update_time': item.updateTime
                },
            changeListener),
        _categoryModelDeletionAdapter = DeletionAdapter(
            database,
            'categories',
            ['id'],
            (CategoryModel item) => <String, Object?>{
                  'name': item.name,
                  'sort_order': item.sortOrder,
                  'id': item.id,
                  'create_time': item.createTime,
                  'update_time': item.updateTime
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<CategoryModel> _categoryModelInsertionAdapter;

  final UpdateAdapter<CategoryModel> _categoryModelUpdateAdapter;

  final DeletionAdapter<CategoryModel> _categoryModelDeletionAdapter;

  @override
  Future<List<CategoryModel>> findAllCategory() async {
    return _queryAdapter.queryList(
        'SELECT * FROM categories ORDER BY sort_order ASC',
        mapper: (Map<String, Object?> row) => CategoryModel(
            row['name'] as String, row['sort_order'] as int,
            id: row['id'] as int?,
            createTime: row['create_time'] as String?,
            updateTime: row['update_time'] as String?));
  }

  @override
  Stream<List<CategoryModel>> findAllTasksAsStream() {
    return _queryAdapter.queryListStream('SELECT * FROM categories',
        mapper: (Map<String, Object?> row) => CategoryModel(
            row['name'] as String, row['sort_order'] as int,
            id: row['id'] as int?,
            createTime: row['create_time'] as String?,
            updateTime: row['update_time'] as String?),
        queryableName: 'categories',
        isView: false);
  }

  @override
  Future<CategoryModel?> findCategoryById(int id) async {
    return _queryAdapter.query('SELECT * FROM categories WHERE id = ?1',
        mapper: (Map<String, Object?> row) => CategoryModel(
            row['name'] as String, row['sort_order'] as int,
            id: row['id'] as int?,
            createTime: row['create_time'] as String?,
            updateTime: row['update_time'] as String?),
        arguments: [id]);
  }

  @override
  Future<void> insertCategory(CategoryModel category) async {
    await _categoryModelInsertionAdapter.insert(
        category, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateCategory(CategoryModel category) async {
    await _categoryModelUpdateAdapter.update(
        category, OnConflictStrategy.replace);
  }

  @override
  Future<int> updateCategories(List<CategoryModel> categories) {
    return _categoryModelUpdateAdapter.updateListAndReturnChangedRows(
        categories, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteCategory(CategoryModel category) async {
    await _categoryModelDeletionAdapter.delete(category);
  }

  @override
  Future<int> deletePersons(List<CategoryModel> categories) {
    return _categoryModelDeletionAdapter
        .deleteListAndReturnChangedRows(categories);
  }
}
