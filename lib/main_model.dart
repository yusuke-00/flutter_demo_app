import 'package:flutter/cupertino.dart';

class MainModel extends ChangeNotifier {
  // ignore: non_constant_identifier_names
  String Provider1 = "Providerの練習";

  void changeProvider1() {
    Provider1 = "Providerの練習!";
    notifyListeners();
  }
}
