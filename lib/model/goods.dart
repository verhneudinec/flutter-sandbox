class Good {
  final String id;
  final String name;
  final bool isHot;
  final String hotAttentionText;

  Good(this.id, this.name, {this.isHot = false, this.hotAttentionText});
}

class GoodInteractor {
  List<Good> getGoods() {
    return _mockList;
  }
}

var _mockList = <Good>[
  Good(
    'tofu',
    'тофу',
  ),
  Good(
    'тест2',
    'Test2',
  ),
  Good(
    'тест3',
    'Test3',
  ),
  Good(
    'peper',
    'перец чили',
    isHot: true,
    hotAttentionText: 'Будет пикантнее',
  ),
  Good(
    'тест5',
    'Test5',
    isHot: true,
    hotAttentionText: 'Ты сам это почувствуешь',
  ),
];
