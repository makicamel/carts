import 'dart:async';
import 'package:bloc_provider/bloc_provider.dart';
import 'package:carts/services/shop.dart';
import 'package:carts/models/shop.dart';
import 'package:rxdart/rxdart.dart';

class ChangeIndex {
  final Shop shop;
  final int index;
  const ChangeIndex(this.shop, this.index);
}

class ShopBloc implements Bloc {
  static const _shopList = ShopService();
  final _shops = BehaviorSubject<List<Shop>>.seeded(Shops.list());
  final _indexController = StreamController<ChangeIndex>();

  ShopBloc() {
    _indexController.stream.listen(_handleChange);
  }

  Sink<ChangeIndex> get change => _indexController.sink;

  ValueObservable<List<Shop>> get shops => _shops.stream;

  void _handleChange(ChangeIndex change) {
    _shopList.moveToUp(change.shop, change.index);
    _shops.value = _shopList.shops;
  }

  @override
  void dispose() async {
    await _indexController.close();
    await _shops.close();
  }
}
