import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:locla_memo_try/components/my_drawer.dart';
import 'package:provider/provider.dart';

import '../components/my_product_tle.dart';
import '../models/shop.dart';

class HomeShop extends StatefulWidget {
  const HomeShop({super.key});

  @override
  State<HomeShop> createState() => _HomeShopState();
}

class _HomeShopState extends State<HomeShop> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final products = context.watch<Shop>().shop;
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
          title: Text('HomeShope. !'),
          shadowColor: Colors.transparent,
          leading: IconButton(
            icon: const Icon(
              Icons.menu,
              color: Colors.teal,
            ),
            onPressed: () {
              _scaffoldKey.currentState?.openDrawer();
            },
          ),
          actions: [
            IconButton(
              onPressed: () {
                _scaffoldKey.currentState?.openDrawer();
              },
              icon: Icon(Icons.add_a_photo_outlined),
            ),
            IconButton(
              onPressed: () {
                _scaffoldKey.currentState?.openEndDrawer();
              },
              icon: Icon(Icons.remove_from_queue),
            ),
          ]),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height/1.5,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: MyProductTile(product: products[index]),
                      );
                    }),
              ),
              SizedBox(height: 102,child: Text('other are here.. !'),)
            ],
          ),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
