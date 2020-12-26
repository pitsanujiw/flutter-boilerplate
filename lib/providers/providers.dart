import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  String name = 'Hello world';

  String get getName => name;

  void setName(String nameStr) {
    name = nameStr;
    notifyListeners();
  }
}
