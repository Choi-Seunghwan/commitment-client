import 'package:commitment_client/models/user_my_info.dart';
import 'package:commitment_client/service/auth_service.dart';
import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  final AuthService authService;

  AuthProvider(this.authService);

  String? _token;
  UserMyInfo? _userMyInfo;

  String? get token => _token;
  UserMyInfo? get userMyInfo => _userMyInfo;

  bool get isAuthenticated => _token != null;

  Future<void> signUpGuest() async {
    Map<String, dynamic> data = await authService.signUpGuest();
    _token = data['token'];
    _userMyInfo = data['userMyInfo'];
    notifyListeners();
  }
}
