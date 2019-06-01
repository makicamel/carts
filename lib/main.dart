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
        dividerColor: Colors.teal,
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
  List<String> _shopList = [
    '肉のハナマサ',
    '野菜や',
    'ドラッグストア',
    '池袋',
  ];
  int _floatingIndex;
  bool _isFloating(int i) => _floatingIndex == i;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: _buildUndoButton(),
        title: _buildMoreButton(),
        actions: <Widget>[_buildAddButton()],
      ),
      body: ListView(
        children: _buildListTile(),
      ),
    );
  }

  List<Widget> _buildListTile() {
    var tiles = <Widget>[];
    for (var i = 0; i < _shopList.length; i++) {
      tiles.add(
        GestureDetector(
          onLongPressStart: (position) {
            setState(() => _floatingIndex = i);
          },
          onLongPressMoveUpdate: (p) => onLongUpdate(p, update: true),
          onLongPressEnd: onLongUpdate,
          child: Opacity(
            opacity: _isFloating(i) ? 0.3 : 1,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              height: 64,
              child: Card(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        _shopList[i],
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }
    return tiles;
  }

  void onLongUpdate(p, {update = false}) {
    var _calculateIndex = ((p.globalPosition.dy - 110) / 64).round();
    if (_calculateIndex > _shopList.length - 1) {
      _calculateIndex = _shopList.length - 1;
    }
    if (_floatingIndex == _calculateIndex && update) {
      return;
    }
    final shopName = _shopList[_floatingIndex];
    print(_calculateIndex);
    setState(() {
      _shopList
        ..removeAt(_floatingIndex)
        ..insert(_calculateIndex, shopName);
      _floatingIndex = update ? _calculateIndex : null;
    });
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
      onPressed: () async {
        final shopName = await showDialog<String>(
          context: context,
          builder: (_) => ShopDialog(),
        );
        setState(() => _shopList.add(shopName));
      },
    );
  }
}
