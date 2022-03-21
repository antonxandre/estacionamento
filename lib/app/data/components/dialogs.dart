// ignore_for_file: deprecated_member_use

import 'dart:async';

import 'package:estacionamento/app/utils/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Dialogs {
  static Future<bool?> showBooleanDialog({
    BuildContext? context,
    required String title,
    required Widget content,
    required Function action,
    bool exitAutomatically = true,
  }) {
    return showDialog<bool>(
        context: Get.context!,
        builder: (BuildContext context) {
          return AlertDialog(
            actionsAlignment: MainAxisAlignment.spaceAround,
            actionsPadding: const EdgeInsets.symmetric(horizontal: 16),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0))),
            title: Center(
                child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
              ),
            )),
            content: content,
            actions: <Widget>[
              IconButton(
                  onPressed: () {
                    return Navigator.of(context).pop(false);
                  },
                  icon: const Icon(
                    Icons.cancel,
                    size: 36,
                    color: AppTheme.error,
                  )),
              IconButton(
                  onPressed: () {
                    if (exitAutomatically) Navigator.of(context).pop(true);
                    action();
                  },
                  icon: const Icon(
                    Icons.check_circle,
                    size: 36,
                    color: AppTheme.success,
                  )),
            ],
          );
        });
  }
}
