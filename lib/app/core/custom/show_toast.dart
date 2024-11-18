import 'package:flip_coin/app/core/theme/app_palette.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

// showToast({required String message, bool? isSuccess}) {
//   Fluttertoast.showToast(
//     msg: message,
//     toastLength: Toast.LENGTH_LONG,
//     backgroundColor:
//     isSuccess == true ? AppPaletteLight.primary : AppPaletteLight.error,
//   );
// }

var fToast;
showToast(String input,
    {ToastGravity? alignment = ToastGravity.BOTTOM,
    bool isSuccess = false,
    int? time,
    Color? color}) {
  Widget toast = Container(
    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(25.0),
      color:
          isSuccess ? AppPaletteLight.gray : color ?? AppPaletteLight.redColor,
    ),
    child: Text(
      input,
      maxLines: 10,
      overflow: TextOverflow.visible,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontFamily: 'Montserrat',
        color: AppPaletteLight.background,
        fontSize: 14,
      ),
    ),
  );

  fToast.showToast(
    child: toast,
    gravity: ToastGravity.BOTTOM,
    toastDuration: Duration(seconds: time ?? 3),
  );
}
