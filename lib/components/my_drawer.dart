import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:locla_memo_try/components/my_tile.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              DrawerHeader(
                child: Column(
                  children: [
                    Container(
                      decoration: const BoxDecoration(color: Colors.blueAccent),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Center(
                              child: SizedBox(
                                height: 100,
                                width: 100,
                                child: Image.asset('lib/images/com.png'),
                              ),
                            ),
                            const Text('jackma@gmail.com'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              MyListTile(
                text: 'Home',
                icon: Icons.home,
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              MyListTile(
                text: 'Cart',
                icon: Icons.shop,
                onTap: () {
                  Navigator.pushNamed(context, '/cartpage');
                },
              ),
            ],
          ),
          MyListTile(
              text: 'Exit',
              icon: Icons.exit_to_app,
              onTap: () {
                exit(0);
              })
        ],
      ),
    );
  }
}
