import 'package:trainingsqlite/Helper/db_helper.dart';
import 'package:trainingsqlite/Helper/provider_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'widget/Task_widget.dart';
import 'screen/new_task.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await DbHalper.dbHalper.initDatabase();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppProvider>(
      create: (context) {
        return AppProvider();
      },
      child: MaterialApp(debugShowCheckedModeBanner: false, home: tabBar()),
    );
  }
}

class tabBar extends StatefulWidget {
  @override
  _tabBarState createState() => _tabBarState();
}

class _tabBarState extends State<tabBar> with TickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Consumer<AppProvider>(builder: (context, value, child) {
        value.selectAllTasks();
        return Scaffold(
          appBar: AppBar(
            title: Text("My Tasks"),
            bottom: TabBar(
              controller: tabController,
              tabs: [
                Tab(
                  child: Text("All Tasks"),
                ),
                Tab(
                  child: Text("Complete Tasks"),
                ),
                Tab(
                  child: Text("InComplete Tasks"),
                ),
              ],
            ),
          ),
          body: TabBarView(
            controller: tabController,
            children: [
              AllTasks(),
              CompleteTasks(),
              InCompleteTasks(),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return NewTask();
              }));
            },
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
            backgroundColor: Colors.blue,
          ),
        );
      }),
    );
  }
}

class AllTasks extends StatelessWidget {
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(builder: (context, value, child) {
      return Column(
        children: value.task.map((e) => TaskWidget(e)).toList(),
      );
    });
  }
}

class CompleteTasks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(builder: (context, value, child) {
      return Column(
        children: value.task
            .where((element) => element.isComplete == true)
            .map((e) => TaskWidget(e))
            .toList(),
      );
    });
  }
}

class InCompleteTasks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(builder: (context, value, child) {
      return Column(
        children: value.task
            .where((element) => element.isComplete == false)
            .map((e) => TaskWidget(e))
            .toList(),
      );
    });
  }
}
