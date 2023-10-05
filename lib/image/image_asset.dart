import 'package:flutter/material.dart';

class ItemImg extends StatelessWidget {
  const ItemImg({
    Key? key,
    required this.itemName,
    this.size = 80,
    this.alpha = 255,
  }) : super(key: key);

  ///商品名
  final String itemName;
  ///画像サイズ
  final double size;
  ///透過
  final int alpha;

  //TODO: 商品画像もfiresotreに置く
  static const _itemImgPathMap = {
    "唐揚げ" : "images/food_karaage_cup.png",
    "たこ焼き" : "images/takoyaki_fune.png",
    "ポテト" : "images/fastfood_potato.png",
    "コーラ" : "images/cola.png"
  };

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      _itemImgPathMap[itemName]!,
      height: size,
      width: size,
      colorBlendMode: BlendMode.modulate,
      color: Colors.white.withAlpha(alpha),
    );
  }
}