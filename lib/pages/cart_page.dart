import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:locla_memo_try/components/my_product_tle.dart';
import 'package:locla_memo_try/components/my_tile.dart';
import 'package:provider/provider.dart';

import '../models/shop.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final products = context.watch<Shop>().shop;
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(
            'Cart Page !',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 300,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    return MyProductTile(product: products[index]);
                  }),
            ),
          ],
        ));
  }
}

// Retrieve arguments
// final Map<String, dynamic> arguments =
// ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

// Access individual data
// final String title = arguments['title'];
// final String subtitle = arguments['id'];
// final String imageUrl = arguments['imageUrl'];
