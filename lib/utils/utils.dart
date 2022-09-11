import 'package:flutter/material.dart';

void showLoading(BuildContext context, String message, bool isCanceled) {
  showDialog(
      barrierDismissible: isCanceled,
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Row(
            children: [CircularProgressIndicator(), Text(message)],
          ),
        );
      });
}

void hideLoading(BuildContext context) {
  Navigator.pop(context);
}

void showMessage(
  BuildContext context,
  String message,
  String posActionText,
  VoidCallback posAction, {
  String? negActionText,
  VoidCallback? negAction,
}) {
  showDialog(context: context, builder: (context){
    return AlertDialog(
      content: Text(message),
      actions: [
        TextButton(onPressed: posAction, child: Text(posActionText))
      ],
    );
  });
}
