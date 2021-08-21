import 'package:flutter/cupertino.dart';

class MyModel with ChangeNotifier {
  String name;
  int number;

  MyModel(this.name, this.number);
  inc() {
    number++;
    notifyListeners();
  }

  change() {
    name = 'amina';
    notifyListeners();
  }
}
