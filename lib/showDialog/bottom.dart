import 'package:flutter/material.dart';

class NotificationButton extends StatefulWidget {
  @override
  _NotificationButtonState createState() => _NotificationButtonState();
}

class _NotificationButtonState extends State<NotificationButton> {
  bool isPressed = false;
  IconData icon = Icons.notifications;
  MaterialColor primaryColor = Colors.blue;
  String buttonText = 'なし';

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(buttonText),
      style: ElevatedButton.styleFrom(
        primary: this.primaryColor,
        onPrimary: Colors.white,
      ),
      onPressed: () {
        this.isPressed = !this.isPressed;
        setState(() {
          this.primaryColor = this.isPressed ? Colors.orange : Colors.blue;
          this.buttonText = this.isPressed ? 'あり' : 'なし'; // テキストを変更
        });
      },
    );
  }
}
