class TaskModel {
  int id;
  String name;
  bool isComplete;
  TaskModel({this.id, this.name, this.isComplete});
  toMap() {
    return {
      // DbHelper.dbcolumnName: this.name,
      // DbHelper.dbColumnIsComplete: this.isComplete
    };
  }

  TaskModel.fromMap(Map map) {
    // this.id = map[DbHelper.dbColumnId];
    // this.name = map[DbHelper.dbcolumnName];
    // this.isComplete = map[DbHelper.dbColumnIsComplete] == 1 ? true : false;
  }
}
