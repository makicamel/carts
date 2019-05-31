import 'package:flutter/material.dart';
import 'package:carts/constants.dart';
import 'package:carts/components/shop_dialog.dart';

void main() => runApp(Carts());

class Carts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Constants.appTitle,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: ShopList(),
    );
  }
}

class ShopList extends StatefulWidget {
  @override
  _ShopListState createState() => _ShopListState();
}

class _ShopListState extends State<ShopList> {
  List<String> _shopList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: _buildUndoButton(),
        title: _buildMoreButton(),
        actions: <Widget>[_buildAddButton()],
      ),
      body: ListView.separated(
        itemBuilder: (context, index) =>
            ListTile(title: Text(_shopList[index])),
        separatorBuilder: (context, _) => Divider(),
        itemCount: _shopList.length,
      ),
    );
  }

  IconButton _buildUndoButton() {
    return IconButton(
      icon: const Icon(Icons.undo),
      onPressed: () {
        print('undo');
      },
    );
  }

  IconButton _buildMoreButton() {
    return IconButton(
      icon: const Icon(Icons.more_horiz),
      onPressed: () {
        print('more');
      },
    );
  }

  IconButton _buildAddButton() {
    return IconButton(
      icon: const Icon(Icons.add_box),
      onPressed: () {
        showDialog<dynamic>(context: context, builder: (_) => ShopDialog());
        setState(() {
          _shopList.add('Shop${_shopList.length + 1}');
        });
      },
    );
  }
}
