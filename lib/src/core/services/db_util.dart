import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;

class DbTables {
  static const favoritedProducts = "favorited_products";
  static const products = "products";
}

class DbUtil {
  static Future<sql.Database> database() async {
    final dbPath = await sql.getDatabasesPath();

    return sql.openDatabase(
      path.join(dbPath, 'app_referencia.db'),
      version: 1,
      onCreate: (db, version) async {
        await db.execute("""CREATE TABLE ${DbTables.products}(
              id int PRIMARY KEY, 
              title TEXT,
              description TEXT,
              category TEXT,
              image TEXT,
              price double
            )""");

        await db.execute("""CREATE TABLE ${DbTables.favoritedProducts}(
              id int PRIMARY KEY, 
              title TEXT,
              description TEXT,
              category TEXT,
              image TEXT,
              price double
            )""");
      },
    );
  }

  static Future<void> insert(String table, Map<String, Object> data) async {
    final db = await DbUtil.database();

    await db.insert(
      table,
      data,
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    );
  }

  static Future<List<Map<String, dynamic>>> getData(String table) async {
    final db = await DbUtil.database();
    return db.query(table);
  }

  static Future<int> deleteById(String table, int id) async {
    final db = await DbUtil.database();
    return await db.delete(table, where: 'id = ?', whereArgs: [id]);
  }
}
