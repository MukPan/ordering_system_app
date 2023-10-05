import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'alert_dialog_texts.dart';

class DefaultAlertDialog extends StatelessWidget {
  const DefaultAlertDialog({Key? key, required this.alertDialogTexts}) : super(key: key);


  ///確認ダイアログの内容
  final AlertDialogTexts alertDialogTexts;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      titleTextStyle: TextStyle(
        fontSize: 30.sp,
      ),
      contentTextStyle: TextStyle(
        fontSize: 20.sp,
      ),
      titlePadding: const EdgeInsets.fromLTRB(40, 30, 40, 0),
      contentPadding: const EdgeInsets.fromLTRB(40, 20, 40, 30),
      actionsPadding: const EdgeInsets.fromLTRB(40, 0, 40, 30),
      title: alertDialogTexts.title,
      content: alertDialogTexts.content,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))
      ),
      actions: [
        TextButton(
          style: TextButton.styleFrom(
            padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          child: Text(
            "いいえ",
            style: TextStyle(
              fontSize: 20.sp,
              color: Colors.indigo,
            ),
          ),
          onPressed: () => Navigator.pop(context, false),
        ),
        Container(
          margin: const EdgeInsets.only(left: 15),
          child: TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.indigo,
              padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            child: Text(
              "はい",
              style: TextStyle(
                fontSize: 20.sp,
                color: Colors.white
              ),
            ),
            onPressed: () => Navigator.pop(context, true),
          ),
        )
      ],
    );
  }
}
