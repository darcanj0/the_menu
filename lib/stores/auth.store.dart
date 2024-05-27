import 'package:flutter/material.dart';
import 'package:the_menu/models/dtos/auth_dto.dart';
import 'package:the_menu/models/user.dart';
import 'package:the_menu/services/i_auth_service.dart';

class AuthStore extends ChangeNotifier {
  final AuthDto _dto = AuthDto(name: '', password: '', email: '');

  AuthModes _authMode = AuthModes.login;

  bool get isLogin => _authMode == AuthModes.login;
  bool get isSignup => _authMode == AuthModes.signup;

  void toggleAuthMode() {
    switch (_authMode) {
      case AuthModes.login:
        _authMode = AuthModes.signup;
      case AuthModes.signup:
        _authMode = AuthModes.login;
    }
    notifyListeners();
  }

  void setName(String name) {
    _dto.name = name;
    notifyListeners();
  }

  void setEmail(String email) {
    _dto.email = email;
    notifyListeners();
  }

  void setPassword(String password) {
    _dto.password = password;
    notifyListeners();
  }

  Future<void> login() async {
    await _authService.login(_dto);
  }

  Future<void> signup() async {
    await _authService.signup(_dto);
  }

  Future<void> logout() async {
    await _authService.logout();
  }

  MenuUser? user;

  final IAuthService _authService;

  AuthStore({required IAuthService authService}) : _authService = authService {
    _authService.userChanges.listen((event) {
      user = event;
      notifyListeners();
    });
  }
}
