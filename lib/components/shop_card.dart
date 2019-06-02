import 'package:flutter/material.dart';

class ShopCard extends Container {
  ShopCard({@required String shopName, double height = 64})
      : super(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          height: height,
          child: Card(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    shopName,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),
        );
}
