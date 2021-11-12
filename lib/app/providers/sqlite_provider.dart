import 'dart:io';

import 'package:biocheck_flutter/app/data/models/models.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class SQLiteProvider {
  static Database? _localDatabase;
  static final SQLiteProvider db = SQLiteProvider._();

  SQLiteProvider._();

  Future<Database> get database async {
    if (_localDatabase != null) {
      return _localDatabase!;
    }
    _localDatabase = await initDB();
    return _localDatabase!;
  }

  // Start the database
  Future<Database> initDB() async {
    // Path of database location
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'EvaluationsDB.db');

    // Database creation
    return await openDatabase(
      path,
      version: 1,
      onOpen: (db) {},
      onCreate: (Database db, int version) async {
        await db.execute('''
        CREATE TABLE Evaluations(
          id TEXT PRIMARY KEY,
          userId INTEGER,
          json TEXT
        )
      ''');
      },
    );
  }

  // RETRIEVE ALL EVALUATIONS
  Future<List<Evaluation>?> getAllEvaluations() async {
    final db = await database;
    final response = await db.query('Evaluations');
    return response.isNotEmpty
        ? response
            .map((e) => Evaluation.fromJson(e['json'].toString()))
            .toList()
        : null;
  }

  // CREATE EVALUATION
  Future<int> saveEvaluation(Evaluation eval) async {
    final db = await database;
    final res = await db.insert(
      'Evaluations',
      {
        'id': eval.id,
        'userId': eval.userId,
        'json': eval.toJson(),
      },
    );
    return res;
  }

  // CREATE MANY EVALUATIONS
  Future<int> saveEvaluations(List<Evaluation> evaluations) async {
    final db = await database;
    int res = 1;

    // TODO: insert all evaluations at once
    for (var e in evaluations) {
      res = await db.insert('Evaluations', {
        'id': e.id,
        'userId': e.userId,
        'json': e.toJson(),
      });
    }

    return res;
  }
}
