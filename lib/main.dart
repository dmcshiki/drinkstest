// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Drinks',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Menu de Bebidas'),
        ),
        body: const Center(
          child: ShowDrinks(),
        ),
      ),
    );
  }
}

class ShowDrinks extends StatelessWidget {
  const ShowDrinks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: <Widget>[
          Container(
            width: 200,
            margin: EdgeInsets.all(10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset('lib/images/drink1.png'),
            ),
          ),
        ],
      ),
    );
  }
}
