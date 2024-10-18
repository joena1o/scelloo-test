import 'package:flutter/material.dart';
import 'package:scelloo_blog_app/main.dart';

class DialogServices {
  void showMessage(message) {
    final snackBar = SnackBar(
      content: Text(
        message,
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.green,
      duration: const Duration(seconds: 2),
    );
    rootScaffoldMessengerKey.currentState?.showSnackBar(snackBar);
  }

  void showMessageError(message) {
    final snackBar = SnackBar(
      content: Text(
        message,
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.red,
      duration: const Duration(seconds: 2),
    );
    rootScaffoldMessengerKey.currentState?.showSnackBar(snackBar);
  }

  void showMessageWithButton(message, action) {
    final snackBar = SnackBar(
      content: Text(
        message,
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.red,
      duration: const Duration(seconds: 4),
      action: SnackBarAction(
        textColor: Colors.white,
        label: 'Verify',
        onPressed: () {
          action();
        },
      ),
    );
    rootScaffoldMessengerKey.currentState?.showSnackBar(snackBar);
  }
}
