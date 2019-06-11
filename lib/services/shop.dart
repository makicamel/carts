import 'package:carts/models/shop.dart';

class ShopService {
  static final List<Shop> _shops = Shops.list();
  const ShopService();

  List<Shop> get shops => _shops;

  void float(int index) => _float(index);

  void moveToUp(int index) => _moveToUp(index);

  void moveToDown(int index) => _moveToDown(index);

  void _float(int index) {
    for (var i = 0; i < _shops.length; i++) {
      i == index ? _shops[i].floatOn() : _shops[i].clearState();
    }
  }

  void _moveToUp(int index) {
    if (index == 0) {
      return;
    }
    final stash = _shops.removeAt(index - 1);
    _shops.insert(index, stash);
    return;
  }

  void _moveToDown(int index) {
    if (index == _shops.length - 1) {
      return;
    }
    final stash = _shops.removeAt(index);
    _shops.insert(index + 1, stash);
    return;
  }
}
