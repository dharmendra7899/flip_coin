import 'package:flip_coin/app/core/custom/app_button.dart';
import 'package:flutter/material.dart';

loading(BuildContext context, Function() provider) {
  provider();
  return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return const AlertDialog(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          title: Center(
            child: CircularProgressIndicator(),
          ),
        );
      });
}

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Theme.of(context).disabledColor.withOpacity(0.01),
                borderRadius: BorderRadius.circular(5),
                boxShadow: boxShadow()),
            child: const Center(child: CircularProgressIndicator.adaptive())),
      ),
    );
  }
}
