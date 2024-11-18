import 'package:flip_coin/app/core/custom/loading.dart';
import 'package:flip_coin/app/core/custom/show_toast.dart';
import 'package:flip_coin/app/core/custom_providers/internet_provider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

validateConnectivity(
    {required context,
    required dynamic provider,
    bool? isLoader = false,
    bool? showMessage = true}) {
  fToast = FToast();
  fToast.init(context);
  var checkInternet = Provider.of<CheckInternet>(context, listen: false);
  checkInternet.checkConnectivity().then((value) {
    if (value) {
      isLoader == true
          ? loading(context, () {
              provider();
            })
          : provider();
    } else {
      if (showMessage == true) {
        showToast("No internet connection.", time: 2);
      }
    }
  });
}
