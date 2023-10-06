import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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

  static const _itemImgPathMap = {
    "唐揚げ" : "images/karaage.png",
    "たこ焼き" : "images/takoyaki.png",
    "ポテト" : "images/potato.png",
    "コーラ" : "images/cola.png",
    "ファンタオレンジ" : "images/fanta_orange.png",
    "ファンタグレープ" : "images/fanta_grape.png",
    "レモンライムソーダ" : "images/lemon_lime_soda.png",
    "緑茶" : "images/green_tea.png",
    "麦茶" : "images/barley_tea.png",
    "水" : "images/water.png",
  };

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      _itemImgPathMap[itemName]!,
      height: size.h,
      width: size.w,
      colorBlendMode: BlendMode.modulate,
      color: Colors.white.withAlpha(alpha),
    );
  }
}