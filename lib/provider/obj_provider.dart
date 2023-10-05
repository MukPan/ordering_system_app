import 'package:flutter/material.dart';

import '../object/item_obj.dart';

class ItemObjProvider extends ChangeNotifier {
  ItemObjProvider(this._itemObj);

  ItemObj _itemObj;

  ItemObj get itemObj => _itemObj;

  // ItemObjを更新するためのメソッドを追加
  void updateItemObj(ItemObj newItemObj) {
    _itemObj = newItemObj;
    notifyListeners();
  }
}