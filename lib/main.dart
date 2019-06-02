import 'package:carts/shop_list.dart';
import 'package:flutter/material.dart';
import 'package:carts/constants.dart';

void main() => runApp(Carts());

class Carts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Constants.appTitle,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        dividerColor: Colors.teal,
      ),
      home: ShopList(),
    );
  }
}
