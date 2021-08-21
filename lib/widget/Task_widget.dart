import 'package:trainingsqlite/Helper/provider_helper.dart';
import 'package:trainingsqlite/model/task_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TaskWidget extends StatelessWidget {
  Task task;

  TaskWidget(this.task);

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (context, provider, child) {
        return Card(
          margin: EdgeInsets.all(10),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("AlertDialog"),
                          content: Text("You Will Delete task are you sure?"),
                          actions: [
                            FlatButton(
                              child: Text("Ok"),
                              onPressed: () async {
                                provider.deleteTask(task.taskid);
                                Navigator.of(context).pop();
                              },
                            ),
                            FlatButton(
                              child: Text("No"),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
                Text(task.taskName),
                Checkbox(
                    value: task.isComplete,
                    onChanged: (value) {
                      task.isComplete = !task.isComplete;
                      provider.updateTask(task);
                    })
              ],
            ),
          ),
        );
      },
    );
  }
}
