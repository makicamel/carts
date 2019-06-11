import 'package:carts/bloc/shop_bloc.dart';
import 'package:carts/bloc/shop_bloc_provider.dart';
import 'package:flutter/material.dart';
import 'package:carts/components/shop_card.dart';

class ShopList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final shopBloc = ShopBlocProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: _buildUndoButton(),
        title: _buildMoreButton(),
        actions: <Widget>[_buildAddButton()],
      ),
      body: StreamBuilder(
        stream: shopBloc.shops,
        initialData: shopBloc.shops.value,
        builder: (context, snapshot) =>
            ListView(children: _buildListTile(shopBloc, snapshot)),
      ),
    );
  }

  List<Widget> _buildListTile(ShopBloc shopBloc, snapshot) {
    var tiles = <Widget>[];
    for (var i = 0; i < snapshot.data.length; i++) {
      tiles.add(
        GestureDetector(
          onTap: () => shopBloc.change.add(ChangeIndex(snapshot.data[i], i)),
          child: AnimatedOpacity(
            opacity: 1,
            duration: Duration(milliseconds: 100),
            child: ShopCard(shopName: snapshot.data[i].name),
          ),
        ),
      );
    }
    return tiles;
  }

  // void onLongUpdate(p, {update = false}) {
  //   var _calculateIndex =
  //       ((p.globalPosition.dy - 110) / Constants.shopCardHeight).round();
  //   if (_calculateIndex > _shopList.length - 1) {
  //     _calculateIndex = _shopList.length - 1;
  //   }
  //   if (_floatingIndex == _calculateIndex && update) {
  //     return;
  //   }
  //   final shopName = _shopList[_floatingIndex];
  //   print(_calculateIndex);
  //   setState(() {
  //     _shopList
  //       ..removeAt(_floatingIndex)
  //       ..insert(_calculateIndex, shopName);
  //     _floatingIndex = update ? _calculateIndex : null;
  //   });
  // }

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
        // final shopName = await showDialog<String>(
        //   context: context,
        //   builder: (_) => ShopDialog(),
        // );
        // setState(() => _shopList.add(shopName));
      },
    );
  }
}
