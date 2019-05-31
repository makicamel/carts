import 'package:flutter/material.dart';

class ShopDialog extends StatefulWidget {
  @override
  _ShopDialogState createState() => _ShopDialogState();
}

class _ShopDialogState extends State<ShopDialog> {
  String _shopName = '';

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: const Text('お店の名前'),
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: <Widget>[
              TextField(
                style: const TextStyle(fontSize: 20),
                onChanged: (text) {
                  setState(() => _shopName = text);
                },
              ),
              const SizedBox(height: 20),
              RaisedButton(
                child: const Text('追加'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
