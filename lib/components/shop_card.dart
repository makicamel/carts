import 'package:flutter/material.dart';

class ShopCard extends StatefulWidget {
  final String shopName;
  final double height;
  bool deleting;

  ShopCard({@required this.shopName, this.height = 64, this.deleting = false});

  @override
  _ShopCardState createState() =>
      _ShopCardState(shopName: shopName, height: height, deleting: deleting);
}

class _ShopCardState extends State<ShopCard> {
  final String shopName;
  final double height;
  bool deleting;

  _ShopCardState({this.shopName, this.height, this.deleting});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: height,
      child: Card(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  shopName,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            deleting ? _buildDeleting() : const Text(''),
          ],
        ),
      ),
    );
  }

  Widget _buildDeleting() {
    final radius = const Radius.circular(6);
    return AnimatedContainer(
      duration: Duration(seconds: 1),
      height: double.infinity,
      width: 100,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.only(topRight: radius, bottomRight: radius),
      ),
      child: Text(
        '削除',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
