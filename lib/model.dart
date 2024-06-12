import 'package:flutter/material.dart';

class Model extends ChangeNotifier{
  int pageIndex = 1;
  void changePage(int index){
     pageIndex = index;
     notifyListeners();
  }
}