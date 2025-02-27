import 'package:flutter/material.dart';

SnackBar snackBarMessage({
  required BuildContext context,
  required String message,
  required Color backgroundColor,
  required double sidePadding,
  required double bottomPadding,
  Animation<double>? animation,
  Duration? duration,
  bool? showCloseIcon,
  DismissDirection? dismissDirection,
  SnackBarAction? snackBarAction
}){
  return SnackBar(
      behavior: SnackBarBehavior.floating,
      showCloseIcon: showCloseIcon ?? true,
      animation: animation,
      dismissDirection: dismissDirection ?? DismissDirection.horizontal,
      duration: duration ?? const  Duration(seconds: 2),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.only(left: sidePadding, right: sidePadding, bottom: bottomPadding),
      content: Center(
        child: Text(
          message, 
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 12,
            color: Colors.white,
          ),
        ),
      ),
      backgroundColor: backgroundColor,
      elevation: 2,
      action: snackBarAction
    );

}


