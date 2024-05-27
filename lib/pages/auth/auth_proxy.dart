import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_menu/stores/auth.store.dart';

class AuthProxy {
  static bool isLogged(BuildContext context) {
    final authStore = context.watch<AuthStore>();
    final isLogged = authStore.user != null;
    return isLogged;
  }
}
