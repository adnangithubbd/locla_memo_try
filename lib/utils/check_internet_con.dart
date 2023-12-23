import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityCheck{

  void check() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      print('I am connected to a mobile network.');
    }
    if (connectivityResult == ConnectivityResult.wifi) {
      print(' I am connected to a wifi network.......');
    }
    if (connectivityResult == ConnectivityResult.ethernet) {
      print('I am connected to a ethernet network.');
    }
    if (connectivityResult == ConnectivityResult.vpn) {
      print('I am connected to a vpn network Note for iOS and macOS');
    }
    if (connectivityResult == ConnectivityResult.bluetooth) {
      print(' am connected to a bluetooth.');
    }
    if (connectivityResult == ConnectivityResult.other) {
      print(
          'I am connected to a network which is not in the above mentioned networks.');
    }
    if (connectivityResult == ConnectivityResult.none) {
      print('I am not connected to any network.');
    }
  }
}