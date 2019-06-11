import 'package:carts/models/shop.dart';

class ShopService {
  static final List<Shop> _shops = Shops.list();
  const ShopService();

  List<Shop> get shops => _shops;

  void moveToUp(Shop shop, index) => _moveToUp(shop, index);

  void moveToDown(Shop shop, index) => _moveToDown(shop, index);

  void _moveToUp(Shop shop, int index) {
    if (index == 0) {
      return;
    }
    final stash = _shops.removeAt(index - 1);
    _shops.insert(index, stash);
    return;
  }

  void _moveToDown(Shop shop, int index) {
    if (index == _shops.length - 1) {
      return;
    }
    final stash = _shops.removeAt(index);
    _shops.insert(index + 1, stash);
    return;
  }
}
