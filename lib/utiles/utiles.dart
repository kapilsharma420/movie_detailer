import 'dart:io';

import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utiles {
  static double setavgrating(List<int> rating) {
    var avgRating = 0;
    for (int i = 0; i < rating.length; i++) {
      avgRating = avgRating + rating[i];
    }
    return double.parse((avgRating/rating.length).toStringAsFixed(1));
  }

  static toastMessage(String message) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      //toastLength: Toast.LENGTH_SHORT,
    );
  }

  static void fieldfocuschange(
    BuildContext context,
    FocusNode current,
    FocusNode nextfocus,
  ) {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextfocus);
  }

  static void FlushBarErrorMessages(String message, BuildContext context) {
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        borderRadius: BorderRadius.circular(20),
        flushbarPosition: FlushbarPosition.BOTTOM,
        positionOffset: 20,
        message: message,
        backgroundColor: Colors.red,
        duration: Duration(seconds: 1),
      )..show(context),
    );
  }

  static void showSnackBar(String message, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,

        duration: Duration(seconds: 2),
      ),
    );
  }
}
