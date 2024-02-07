import 'package:commitment_client/models/user_my_info.dart';
import 'package:commitment_client/service/auth_service.dart';
import 'package:commitment_client/types/constant.dart';
import 'package:commitment_client/utils/toast_util.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier {
  final AuthService authService;

  String? _token;
  UserMyInfo? _userMyInfo;

  String? get token => _token;
  UserMyInfo? get userMyInfo => _userMyInfo;
  bool get isAuthenticated => _token != null && _userMyInfo != null;

  AuthProvider(this.authService);

  Future<void> initUserAuth() async {
    await _loadUserToken();

    if (token != null) {
      await signInToken();
    }
  }

  Future<void> _saveUserTokenToPrefs(String? token) async {
    if (token != null) {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString(SharedPrefs.userToken, token);
    }
  }

  Future<void> _loadUserToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _token = prefs.getString(SharedPrefs.userToken);

    if (_token != null) {}

    notifyListeners();
  }

  Future<void> signUpGuest() async {
    Map<String, dynamic> data = await authService.signUpGuest();
    _token = data['token'];
    _userMyInfo = data['userMyInfo'];

    await _saveUserTokenToPrefs(token);
    notifyListeners();
  }

  Future<void> signInToken() async {
    try {
      Map<String, dynamic> data = await authService.signInToken();
      _userMyInfo = data['userMyInfo'];

      notifyListeners();
    } catch (e) {
      showWarringToast('fail signIn');
    }

    // @todo : need refresh token
    // _token = data['token'];
    // await _saveUserTokenToPrefs(token);
  }
}
