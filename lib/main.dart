import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trainingsqlite/providerclass.dart';

void main() {
  runApp(ChangeNotifierProvider<TOdoProvider>(
    create: (context) => TOdoProvider(),
    child: MaterialApp(debugShowCheckedModeBanner: false, home: MyHome()),
  ));
}

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider'),
      ),
      body: Column(
        children: [
          Text(Provider.of<TOdoProvider>(context).name),
          ElevatedButton(
              onPressed: () {
                Provider.of<TOdoProvider>(context, listen: false)
                    .changeNam('amina');

                // print(Provider.of<TOdoProvider>(context, listen: false).name);
              },
              child: Text('change'))
        ],
      ),
    );
  }
}
