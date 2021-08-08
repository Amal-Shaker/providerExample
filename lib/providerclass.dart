import 'package:flutter/cupertino.dart';

class TOdoProvider extends ChangeNotifier {
//  List<TaskModel> allTasks;
  String name = 'amal';
  changeNam(String newName) {
    this.name = newName;
    notifyListeners();
  }

  getAllTasks() async {
    //this.allTasks = await DbHelper.dbhelper.getAlltask();
  }

  insertTasks() async {}

  updateTasks() async {}

  deleteTask() async {}
}
