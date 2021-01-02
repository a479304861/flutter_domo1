import 'package:flutter/foundation.dart';
import 'package:flutter_domo1/smallDemo/provider/BaseViewModel.dart';

class MyViewModel extends BaseViewModel {
  int count=0;

  load() {
    print("load");
  }
  callback(){

  }
  add() {
    count++;
    notifyListeners();
  }
}
