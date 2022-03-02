// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'EmployeeDatabase.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorEmployeeDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$EmployeeDatabaseBuilder databaseBuilder(String name) =>
      _$EmployeeDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$EmployeeDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$EmployeeDatabaseBuilder(null);
}

class _$EmployeeDatabaseBuilder {
  _$EmployeeDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$EmployeeDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$EmployeeDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<EmployeeDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$EmployeeDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$EmployeeDatabase extends EmployeeDatabase {
  _$EmployeeDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  EmployeeDao? _databaseDaoInstance;

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
            'CREATE TABLE IF NOT EXISTS `EmployeeEntity` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `name` TEXT, `username` TEXT, `email` TEXT, `profileImage` TEXT, `address` TEXT, `phone` TEXT, `website` TEXT, `company` TEXT)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  EmployeeDao get databaseDao {
    return _databaseDaoInstance ??= _$EmployeeDao(database, changeListener);
  }
}

class _$EmployeeDao extends EmployeeDao {
  _$EmployeeDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _employeeEntityInsertionAdapter = InsertionAdapter(
            database,
            'EmployeeEntity',
            (EmployeeEntity item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'username': item.username,
                  'email': item.email,
                  'profileImage': item.profileImage,
                  'address': item.address,
                  'phone': item.phone,
                  'website': item.website,
                  'company': item.company
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<EmployeeEntity> _employeeEntityInsertionAdapter;

  @override
  Future<List<EmployeeEntity>> findAllPersons() async {
    return _queryAdapter.queryList('SELECT * FROM EmployeeEntity',
        mapper: (Map<String, Object?> row) => EmployeeEntity(
            id: row['id'] as int?,
            name: row['name'] as String?,
            username: row['username'] as String?,
            email: row['email'] as String?,
            profileImage: row['profileImage'] as String?,
            address: row['address'] as String?,
            phone: row['phone'] as String?,
            website: row['website'] as String?,
            company: row['company'] as String?));
  }

  @override
  Future<List<EmployeeEntity>> getSearchData(String keyword) async {
    return _queryAdapter.queryList(
        'SELECT * FROM EmployeeEntity WHERE name LIKE ?1 OR email LIKE ?1 ORDER BY id DESC',
        mapper: (Map<String, Object?> row) => EmployeeEntity(id: row['id'] as int?, name: row['name'] as String?, username: row['username'] as String?, email: row['email'] as String?, profileImage: row['profileImage'] as String?, address: row['address'] as String?, phone: row['phone'] as String?, website: row['website'] as String?, company: row['company'] as String?),
        arguments: [keyword]);
  }

  @override
  Future<void> insertContent(EmployeeEntity employeeEntity) async {
    await _employeeEntityInsertionAdapter.insert(
        employeeEntity, OnConflictStrategy.abort);
  }
}
