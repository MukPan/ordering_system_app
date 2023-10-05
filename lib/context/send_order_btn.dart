import 'package:cash_register_app/pages/submission_completion_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SendOrderBtn extends StatelessWidget {
  const SendOrderBtn({Key? key}) : super(key: key);

  ///注文完了ページへの遷移メソッド
  void moveSubmissionCompletionPage(BuildContext context) => {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const SubmissionCompletionPage()
    ))
  };

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          //ページ遷移
          moveSubmissionCompletionPage(context);
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.orange),
        ),
        child: Text(
          "注文を確定する",
          style: TextStyle(
              color: Colors.white,
              fontSize: 15.sp
          ),
        )
    );
  }
}
