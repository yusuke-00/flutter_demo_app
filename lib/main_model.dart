import 'package:flutter/cupertino.dart';

class MainModel extends ChangeNotifier {
  String Provider1 = "Providerの練習";

  void changeProvider1() {
    Provider1 = "Providerの練習!";
    notifyListeners();
  }
}
