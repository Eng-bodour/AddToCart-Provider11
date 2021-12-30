import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provideraddtocart/Model/item.dart';
import './Model/checkout.dart';

import 'Model/cart.dart';
//import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Item> items = [
    Item(name: 'Iphone xr', price: 2800),
    Item(name: 'Iphone xs ', price: 3200),
    Item(name: 'Iphone xs  Max', price: 3500),
    Item(name: 'Iphone 12', price: 3000),
    Item(name: 'Iphone 12 Pro', price: 4500),
    Item(name: 'Iphone 12 Pro Max', price: 4800),
    Item(name: 'Iphone 13', price: 4000),
    Item(name: 'Iphone 13 Pro', price: 5000),
    Item(name: 'Iphone 13 Pro Max', price: 6000),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Shopping',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,

        // ignore: prefer_const_literals_to_create_immutables
        actions: <Widget>[
          Consumer<Cart>(
              builder: (context, value, child) => Padding(
                    padding: const EdgeInsets.only(right: 50),
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Cheched(),
                                  ));
                            },
                            icon: const Icon(Icons.add_shopping_cart)),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Text('${value.count}'),
                      ],
                    ),
                  )),
        ],
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Card(
            child: Consumer<Cart>(
              builder: (context, value, child) {
                return ListTile(
                  title: Text(items[index].name),
                  trailing: IconButton(
                    onPressed: () {
                      value.add(items[index]);
                    },
                    icon: const Icon(Icons.add),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
