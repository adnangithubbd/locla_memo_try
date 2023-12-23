import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:locla_memo_try/pages/home_page.dart';
import 'package:locla_memo_try/pages/shop_page.dart';
import 'package:locla_memo_try/pages/intro_page.dart';
import 'package:locla_memo_try/pages/cart_page.dart';
import 'package:locla_memo_try/providers/counter_provider.dart';
import 'package:locla_memo_try/providers/data_provider.dart';
import 'package:locla_memo_try/stream_details/data_providers.dart';
import 'package:locla_memo_try/stream_details/stream_home.dart';
import 'package:locla_memo_try/themes/light_mode.dart';
import 'package:provider/provider.dart';

import 'models/shop.dart';
import 'package:dio/dio.dart';


void main() async {
  await Hive.initFlutter();
  await Hive.openBox('mainBox');

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CounterModel(),
        ),
        ChangeNotifierProvider(create: (context) => DataProvider()),
        ChangeNotifierProvider(create: (context)=>Shop()),
        ChangeNotifierProvider(create: (context)=>DataPro()),
      ],
      child: const MyApp(),
    ),
  );
   donwload();

 }
  donwload(){
  FileDownloader.downloadFile(url: 'https://i.dummyjson.com/data/products/1/thumbnail.jpg',
  onDownloadError: (String err){
    print('............ $err');
  },
  onDownloadCompleted: (path){
    final File file=File(path);
    print(file);
  }
  );
  }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: lightMode,
      home: const StreamHome(),
      routes: {
        '/cartpage': (context) => CartPage(),
        '/shoppage': (context) => HomeShop(),
        '/intropage': (context) => IntroPage(),
      },
    );
  }
}
