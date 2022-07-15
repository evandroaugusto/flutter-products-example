import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;

import 'db_tables.dart';

class DbSqflite {
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
}
