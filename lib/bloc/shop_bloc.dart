import 'dart:async';
import 'package:bloc_provider/bloc_provider.dart';
import 'package:carts/services/shop.dart';
import 'package:carts/models/shop.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

class ChangeIndex {
  final Shop _shop;
  final int _index;
  final ShopState _state;
  const ChangeIndex({shop, @required index, state})
      : _shop = shop,
        _index = index,
        _state = state ?? ShopState.none;

  int get index => _index;
  bool toFloat() => _state == ShopState.floating;
}

class ShopBloc implements Bloc {
  static const _shopList = ShopService();
  final _shops = BehaviorSubject<List<Shop>>.seeded(Shops.list());
  final _conditionController = StreamController<ChangeIndex>();

  ShopBloc() {
    _conditionController.stream.listen(_handleChange);
  }

  Sink<ChangeIndex> get change => _conditionController.sink;

  ValueObservable<List<Shop>> get shops => _shops.stream;

  void _handleChange(ChangeIndex change) {
    if (change.toFloat()) {
      _shopList.float(change.index);
    } else {
      _shopList.moveToUp(change.index);
    }
    _shops.value = _shopList.shops;
  }

  @override
  void dispose() async {
    await _conditionController.close();
    await _shops.close();
  }
}
