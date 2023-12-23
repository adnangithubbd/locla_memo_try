import 'dart:async';

import 'package:faker/faker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:locla_memo_try/components/my_button.dart';
import 'package:locla_memo_try/pages/shop_page.dart';
import 'package:locla_memo_try/pages/cart_page.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  void initState() {
    // TODO: implement initState
    Timer(
        const Duration(seconds: 1),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const HomeShop())));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final faker = Faker();
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.trolley,
              size: 44,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Welcome to our shop !',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                faker.lorem.words(12).join(' '),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
            ElevatedButton(
                onPressed: () {}, child: const Icon(Icons.next_plan)),
          ],
        ),
      ),
    );
  }
}
