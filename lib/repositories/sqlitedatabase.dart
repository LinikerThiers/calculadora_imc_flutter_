import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;


Map<int, String> scripts = {
  1: ''' CREATE TABLE imc (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          nome TEXT,
          peso REAL,
          altura REAL,
          resultado REAL,
          statusImc TEXT
          );'''
};

class SQLiteDataBase {

  static Database? db;

  Future<Database> obterDataBase() async {
    if(db == null) {
      return await iniciarBancoDeDados();
    } else {
      return db!;
    }
  }
  
  Future<Database> iniciarBancoDeDados() async {
  String dbPath = path.join(await getDatabasesPath(), 'database.db');
  debugPrint("Caminho do banco de dados: $dbPath");

  var db = await openDatabase(
    dbPath,
    version: scripts.length,
    onCreate: (Database db, int version) async {
      for (var i = 1; i <= scripts.length; i++) {
        await db.execute(scripts[i]!);
        debugPrint("Script $i executado: ${scripts[i]!}");
      }
    },
    onUpgrade: (Database db, int oldVersion, int newVersion) async {
      for (var i = oldVersion + 1; i <= scripts.length; i++) {
        await db.execute(scripts[i]!);
        debugPrint("Script $i executado: ${scripts[i]!}");
      }
    },
  );
  return db;
}


}