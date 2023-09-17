import 'package:flutter/material.dart';

void ShowBottomSheetMenu(BuildContext context) {
  showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
      ),
      builder: (builder) {
        return Container(
          height: 350.0,
          color: Colors.transparent,
          child: const Center(
            child: Text("This is a modal sheet"),
          ),
        );
      });
}
