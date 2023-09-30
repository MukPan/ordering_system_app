// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

import 'item_infos.dart';

// class MyWidget extends StatelessWidget {
//   const MyWidget({super.key});
//
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     final List<ItemInfo> itemInfoList = itemInfos.getList();
//
//     List<String> itemNames = ["たこ焼き", "コーラ", "ポテト","唐揚げ", ];
//     List<ItemInfo> itemsInfoList = [];
//     List<List<OptInfo>> itemsOptionsList = [];
//
//     for (String itemName in itemNames) {
//       ItemInfo itemInfo = itemInfoList.firstWhere(
//             (itemInfo) => itemInfo.itemName == itemName,
//         orElse: () => ItemInfo(itemName: "", category: "", itemPrice: 0, optInfoList: []),
//       );
//       itemsInfoList.add(itemInfo);
//       itemsOptionsList.add(itemInfo.optInfoList);
//     }
//     return Scaffold();
//   }
// }



final List<ItemInfo> itemInfoList = itemInfos.getList();

ItemInfo karaageInfo = itemInfoList
    .where ((itemInfo )=> itemInfo. itemName == "唐揚げ")
    .first;
ItemInfo takoyakiInfo = itemInfoList
    .where ((itemInfo )=> itemInfo. itemName == "たこ焼き")
    .first;
ItemInfo kouraInfo = itemInfoList
    .where ((itemInfo )=> itemInfo. itemName == "コーラ")
    .first;
ItemInfo potetoInfo = itemInfoList
    .where ((itemInfo )=> itemInfo. itemName == "ポテト")
    .first;



List<OptInfo> karaageOptions = karaageInfo.optInfoList;

List<OptInfo> takoyakiOptions = takoyakiInfo.optInfoList;
List<OptInfo> kouraOptions = kouraInfo.optInfoList;
List<OptInfo> potetoOptions = potetoInfo.optInfoList;
