import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class CounterModel extends ChangeNotifier{
  var mainBoxRef=Hive.box('mainBox');
  int count=0;
  int getCount(){
    return count;
  }
  increment(){
    count++;
    mainBoxRef.put('countRef', count);
    notifyListeners();
  }
  int getCountRef(){
    int countRef=mainBoxRef.get('countRef',defaultValue: 0);
    return countRef;
  }
}