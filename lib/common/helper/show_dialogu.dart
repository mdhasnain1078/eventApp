import 'package:flutter/material.dart';

showAlertDialog(
    {required BuildContext context, required String message, String? btnText}) {
  return showDialog(
      context: context,
      builder: (context) => AlertDialog(
            content: Text(
              message,
              style: const TextStyle(color: Colors.black, fontSize: 15),
            ),
            contentPadding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
            actions: [
              TextButton(
                onPressed: ()=> Navigator.of(context).pop(),
                child: Text(
                  btnText ?? "Ok",
                  style: const TextStyle(color: Colors.black),
                ),
              )
            ],
          ));
}