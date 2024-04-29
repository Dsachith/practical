import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class ErrorToast {
  void showError(BuildContext context, String message,
      [Icon? icon, VoidCallback? onRetry]) {
    final Flushbar flushBar = Flushbar(
      flushbarPosition: FlushbarPosition.BOTTOM,
      flushbarStyle: FlushbarStyle.FLOATING,
      reverseAnimationCurve: Curves.decelerate,
      forwardAnimationCurve: Curves.fastLinearToSlowEaseIn,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 20,
      ),
      borderRadius: BorderRadius.circular(10),
      isDismissible: true,
      backgroundColor: Colors.white,
            mainButton: onRetry != null
          ? TextButton(
              onPressed: () {
                Navigator.pop(context);
                onRetry();
              },
              child: const Text(
                "Try Again",
                style: TextStyle(
                  color: Color(0xFFFFA73B),
                  fontSize: 13.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          : null,
      messageText: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 6.0),
            child: icon ?? const Icon(
              Icons.error_outline_rounded,
              color: Colors.amberAccent,
            ),
          ),
          Expanded(
            child: Text(
              message,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 13.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
