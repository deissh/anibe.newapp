import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> initSqlite() async {
  final path = join(await getDatabasesPath(), "anibe.db");
  final db = await openDatabase(
    path,
    version: 1,
    onCreate: _createDb,
    onUpgrade: _upgradeDb,
  );
  print("db version = ${await db.getVersion()}");
  return db;
}

Future<void> _createDb(Database db, int version) async {
  await db.execute("CREATE TABLE auth (token TEXT)");
}

Future<void> _upgradeDb(Database db, int oldVersion, int newVersion) async {
  for (var i = oldVersion; i < newVersion; ++i) {
    _upgradeDbInner(db, i);
  }
}

Future<void> _upgradeDbInner(Database db, int oldVersion) async {
  print("Upgrading db from version $oldVersion to version ${oldVersion + 1}");

  switch (oldVersion) {
    // case 1:
    //   await db.execute("ALTER TABLE fav_nodes ADD COLUMN map_id TEXT");
    //   break;

    default:
      throw Exception("Unknown db version = $oldVersion");
  }
}
