import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  final SharedPreferences _preferences;

  bool _showLoader = false;

  bool get showLoader => _showLoader;

  bool? _token = false;
  String? _phoneNumber = "";

  bool? get token => _token;

  String? get number => _phoneNumber;

  String? _userID = '';
  String? verificationID;

  String? get userID => _userID;

  AuthProvider(this._preferences) {
    _token = _preferences.getBool("token") ?? false;
    _userID = _preferences.getString("userID") ?? '';
  }

  _setShowLoader(bool value) {
    _showLoader = value;
    notifyListeners();
  }

  bool get isUserLoggedIn {
    var userDetails = _preferences.getBool("token") ?? false;
    if (userDetails == false) {
      return false;
    } else {
      return true;
    }
  }

  bool get isWalkthrough {
    return _preferences.getBool("walkthrough") ?? true;
  }

  String get getUserId {
    return _preferences.getString("userID") ?? "";
  }

  bool get getToken {
    return _preferences.getBool("token") ?? false;
  }

  String get getNumber {
    return _preferences.getString("number") ?? "";
  }

  setWalkthrough() {
    _preferences.setBool("walkthrough", false);
  }
}
