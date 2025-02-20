import 'package:calculadoraimc1/model/imc_model.dart';
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
  
}