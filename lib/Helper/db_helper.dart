import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:trainingsqlite/model/task_model.dart';

class DbHalper {
  DbHalper._();

  static DbHalper dbHalper = DbHalper._();
  Database database;
  static final String databaseName = 'tasksDB.db';
  static final String tableName = 'tasks';
  static final String taskIdColumnName = 'id';
  static final String taskNameColumnName = 'name';
  static final String taskIsCompleteColumnName = 'isComplete';
  static final String colTitle = 'title';
  initDatabase() async {
    database = await createConnection();
  }

  Future<Database> createConnection() async {
    Directory directory = await getApplicationDocumentsDirectory();

    Database database = await openDatabase(join(directory.path, databaseName),
        version: 1, onCreate: (db, version) {
      db.execute(
          '''CREATE TABLE $tableName ($taskIdColumnName INTEGER PRIMARY KEY AUTOINCREMENT, $taskNameColumnName TEXT, $taskIsCompleteColumnName INTEGER)''');
    });
    return database;
  }

  insertNewTasks(Task task) async {
    try {
      int x = await database.insert(tableName, task.toMap());
      return x;
    } on Exception catch (e) {
      return null;
    }
  }

  Future<List<Task>> selectAllTasks() async {
    try {
      List<Map<String, dynamic>> results = await database.query(tableName);
      List<Task> tasks = results.map((e) => Task.fromMap(e)).toList();
      return tasks;
    } on Exception catch (e) {
      return null;
    }
  }

  Future updateTask(Task task) async {
    try {
      await database.update(tableName, task.toMap(),
          where: '$taskIdColumnName=?', whereArgs: [task.taskid]);
      return true;
    } on Exception catch (e) {
      return null;
    }
  }

  deleteTask(int id) async {
    try {
      await database
          .delete(tableName, where: '$taskIdColumnName=?', whereArgs: [id]);
      return true;
    } on Exception catch (e) {
      return null;
    }
  }
}
