import 'package:flutter/material.dart';

class DataProvider extends ChangeNotifier {
  static final dataList = ['sports', 'election', 'movies', 'games', 'politics'];
  String datatype = 'tech';
  setdata(String type) {
    datatype = type;
    notifyListeners();
  }
}
