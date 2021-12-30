import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provideraddtocart/Model/cart.dart';

class Cheched extends StatefulWidget {
  const Cheched({Key? key}) : super(key: key);

  @override
  _ChechedState createState() => _ChechedState();
}

class _ChechedState extends State<Cheched> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Checked',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.black,
        ),
        floatingActionButton: Consumer<Cart>(
          builder: (context, value, child) => Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'TotalPrice : ${value.totalPrice()}',
              style: const TextStyle(
                  fontWeight: FontWeight.w500, color: Colors.black),
            ),
          ),
        ),
        body: Consumer<Cart>(
          builder: (context, value, child) {
            return ListView.builder(
              itemCount: value.product.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(value.product[index].name),
                    subtitle: Text('${value.product[index].price}'),
                    trailing: IconButton(
                      icon: const Icon(Icons.remove),
                      onPressed: () {
                        value.remove(value.product[index]);
                      },
                    ),
                  ),
                );
              },
            );
          },
        ));
  }
}
