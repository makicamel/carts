import 'package:meta/meta.dart';

enum ShopState { floating, none }

@immutable
class Shop {
  final int _id;
  final int _index;
  final String _name;
  ShopState _state;
  Shop({id, index, name, state})
      : _id = id,
        _index = index,
        _name = name,
        _state = state ?? ShopState.none;

  String get name => _name;

  void floatOn() => _state = ShopState.floating;
  void clearState() => _state = ShopState.none;
  bool isFloating() => _state == ShopState.floating;
}

// Just only for example
class Shops {
  static List<String> _shopList = [
    '成城固井',
    'フレッシュベジータ',
    'トラックストア',
    '□い',
  ];

  static List<Shop> list() {
    List<Shop> result = [];
    for (var i = 0; i < _shopList.length; i++) {
      result.add(Shop(id: i, index: i, name: _shopList[i]));
    }
    return result;
  }
}
