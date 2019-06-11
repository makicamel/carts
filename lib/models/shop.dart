import 'package:meta/meta.dart';

@immutable
class Shop {
  final int id;
  final int index;
  final String name;
  const Shop(this.id, this.index, this.name);
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
      result.add(Shop(i, i, _shopList[i]));
    }
    return result;
  }
}
