import 'package:sqflite/sqflite.dart' as sql;
import 'db_sqflite.dart';

class DbUtil {
  static Future<void> insert(String table, Map<String, Object> data) async {
    final db = await DbSqflite.database();

    await db.insert(
      table,
      data,
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    );
  }

  static Future<List<Map<String, dynamic>>> getData(String table) async {
    final db = await DbSqflite.database();
    return db.query(table);
  }

  static Future<int> deleteById(String table, int id) async {
    final db = await DbSqflite.database();
    return await db.delete(table, where: 'id = ?', whereArgs: [id]);
  }
}
