import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class AppDialogs {


  static void progressAlertDialog({required BuildContext context}) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return WillPopScope(
            onWillPop: () async {
              return false;
            },
            child: const Center(
              child: /*CupertinoActivityIndicator(
                radius: 50,
                color: AppColors.THEME_COLOR_PINK,
              )*/
                  CircularProgressIndicator(
                backgroundColor: AppColors.secondary,
                color: AppColors.secondary,
              ),
            ),
          );
        });
  }

  static Future<dynamic> customBottomSheet({
    bool isDismissed = true,
    BuildContext? context,
    Widget? child,
  }) {
    return showModalBottomSheet(
        isScrollControlled: true,
        isDismissible: isDismissed,
        backgroundColor: AppColors.secondary,
        context: context!,
        builder: (_) {
          return  Container(
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                decoration: const BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: child),
          );
        });
  }

}
