import 'package:flutter/material.dart';

class DataProvider extends ChangeNotifier {
  static List<String> dataList = [
    'General',
    'Business',
    'Sports',
    'Entertainment',
    'Health',
    'Science',
    'Technology'
  ];



  String datatype = dataList[0].toLowerCase();
  setdata(String type) {
    datatype = type.toLowerCase();
    notifyListeners();
  }

  void setTypebyIndex(int index) {
    datatype = dataList[index].toLowerCase();
    notifyListeners();
  }

  bool isSelected(String type) {
    if (type.toLowerCase() == datatype.toLowerCase()) {
      // notifyListeners();
      return true;
    }
    return false;
  }
}
