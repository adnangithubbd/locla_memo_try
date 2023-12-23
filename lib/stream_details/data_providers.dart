import 'package:flutter/cupertino.dart';

class DataPro extends ChangeNotifier {
  Stream<int> update() {

    return Stream<int>.periodic(
        const Duration(seconds: 1), (int count) => count).take(10);
  }
}
