import 'package:flutter/material.dart';
import 'home.dart';
import 'package:provider/provider.dart';
import './Model/cart.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => Cart(),
    child: const MaterialApp(
      home: Home(),
      title: 'ADD To Cart',
    ),
  ));
}
