import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';

class CheckInternet extends ChangeNotifier {
  bool _isConnected = false;
  bool get isConnected => _isConnected;
  Future<bool> checkConnectivity() async {
    try {
      final result = await InternetAddress.lookup('example.com');

      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        _isConnected = true;
        notifyListeners();
        return true;
      }
    } on SocketException catch (_) {
      _isConnected = false;
      notifyListeners();
      return false;
    }
    _isConnected = false;
    notifyListeners();
    return false;
  }
}
