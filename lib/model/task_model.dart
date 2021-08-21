import 'package:trainingsqlite/Helper/db_helper.dart';

class Task {
  int taskid;
  String taskName;
  bool isComplete;

  Task({this.taskid, this.taskName, this.isComplete});

  toMap() {
    return {
      DbHalper.taskNameColumnName: this.taskName,
      DbHalper.taskIsCompleteColumnName: this.isComplete ? 1 : 0
    };
  }

  Task.fromMap(Map map) {
    this.taskid = map[DbHalper.taskIdColumnName];

    this.taskName = map[DbHalper.taskNameColumnName];
    this.isComplete =
        map[DbHalper.taskIsCompleteColumnName] == 1 ? true : false;
  }
}
