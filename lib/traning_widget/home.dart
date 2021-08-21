import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'change.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("read method"),
      ),
      body: ChangeNotifierProvider<MyModel>(
        create: (context) => MyModel('amal', 19),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              MyNameWidget(),
              SizedBox(
                height: 20,
              ),
              MyNumberWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class MyNameWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('widget name');
    var mymodel = context.select((MyModel m) => m.name);
    return Column(
      children: [
        Text(mymodel),
        IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              Provider.of<MyModel>(context, listen: false).change();
            })
      ],
    );
  }
}

class MyNumberWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('widget number');
    var m = context.select((MyModel mymodel) => mymodel.number);
    return Column(
      children: [
        Text("$m"),
        IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Provider.of<MyModel>(context, listen: false).inc();
            })
      ],
    );
  }
}
