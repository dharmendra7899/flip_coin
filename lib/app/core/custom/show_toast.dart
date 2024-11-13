import 'package:flip_coin/app/core/theme/app_palette.dart';
import 'package:fluttertoast/fluttertoast.dart';

showToast({required String message, bool? isSuccess}) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    backgroundColor:
    isSuccess == true ? AppPaletteLight.primary : AppPaletteLight.error,
  );
}