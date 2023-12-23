import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:hive/hive.dart';
import 'package:locla_memo_try/models/product.dart';
import 'package:locla_memo_try/providers/counter_provider.dart';
import 'package:locla_memo_try/providers/data_provider.dart';
import 'package:lottie/lottie.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;
import 'package:connectivity_plus/connectivity_plus.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _hasPermissions = false;

  @override
  void initState() {
    super.initState();
    _fetchPermissions();
  }

  void _fetchPermissions() {
    Permission.locationWhenInUse.status.then((status) {
      if (mounted) {
        setState(() {
          _hasPermissions = (status == PermissionStatus.granted);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HOME'),
        actions: [
          IconButton(
              onPressed: () {}, icon: Icon(Icons.currency_exchange_outlined))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _hasPermissions ? _compassWidget() : _permistionSheet(),
            Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.blueAccent
                ),
                child: Lottie.asset('lib/images/anim.json')),
          ],
        ),
      ),
    );
  }

  Widget _compassWidget() {
    return StreamBuilder<CompassEvent>(
        stream: FlutterCompass.events,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('The error is .>>. . ! ${snapshot.error.toString()}'),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          double? direction = snapshot.data?.heading;
          if (direction == null) {
            return const Center(
              child: Text('You device does not support this one'),
            );
          }
          return Center(
            child: SizedBox(
              height: 200,
              width: 200,
              child: Padding(
                padding: const EdgeInsets.all(25),
                child: Transform.rotate(
                  angle: direction * (math.pi/180)*-1,
                  child: Image.asset('lib/images/com.png'),
                ),
              ),
            ),
          );
        });
  }

  //permission sheet
  Widget _permistionSheet() {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          Permission.locationWhenInUse.request().then((value) {
            setState(() {
              _hasPermissions = (value == PermissionStatus.granted);
            });
          });
        },
        child: const Text('Request Permission'),
      ),
    );
  }
}
