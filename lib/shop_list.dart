import 'package:flutter/material.dart';
import 'package:carts/components/shop_card.dart';
import 'package:carts/components/shop_dialog.dart';
import 'package:carts/constants.dart';

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
  int _removingIndex;
  bool _isFloating(int i) => _floatingIndex == i;
  bool _isRemoving(int i) => _removingIndex == i;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: _buildUndoButton(),
        title: _buildMoreButton(),
        actions: <Widget>[_buildAddButton()],
      ),
      body: ListView(children: _buildListTile()),
    );
  }

  List<Widget> _buildListTile() {
    var tiles = <Widget>[];
    for (var i = 0; i < _shopList.length; i++) {
      var card = ShopCard(shopName: _shopList[i]);
      tiles.add(
        GestureDetector(
          onLongPressStart: (p) => setState(() => _floatingIndex = i),
          onLongPressMoveUpdate: (p) => onLongUpdate(p, update: true),
          onLongPressEnd: onLongUpdate,
          onHorizontalDragStart: (p) {
            setState(() => _removingIndex = i);
          },
          child: AnimatedOpacity(
            opacity: _isFloating(i) ? 0.3 : 1,
            duration: Duration(milliseconds: 100),
            child: card,
          ),
        ),
      );
    }
    return tiles;
  }

  void onLongUpdate(p, {update = false}) {
    var _calculateIndex =
        ((p.globalPosition.dy - 110) / Constants.shopCardHeight).round();
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
