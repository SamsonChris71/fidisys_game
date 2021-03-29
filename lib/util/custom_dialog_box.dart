import 'package:flutter/material.dart';

Future customDialogBox(String label, BuildContext context) {
  return showDialog(
    context: context,
    builder: (_) => WillPopScope(
      onWillPop: () {
        return null;
      },
      child: AlertDialog(
        title: Center(
          child: Row(
            children: [
              CircularProgressIndicator(),
              SizedBox(
                width: 25.0,
              ),
              Text(label),
            ],
          ),
        ),
      ),
    ),
  );
}
