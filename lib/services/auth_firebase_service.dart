import 'dart:async';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:the_menu/models/dtos/auth_dto.dart';
import 'package:the_menu/models/user.dart';
import 'package:the_menu/services/i_auth_service.dart';

class AuthFirebaseService implements IAuthService {
  AuthFirebaseService();

  static final _firebaseAuth = FirebaseAuth.instance;
  static final _firebaseAnalytics = FirebaseAnalytics.instance;

  @override
  Future<void> login(AuthDto dto) async {
    await _firebaseAuth.signInWithEmailAndPassword(
        email: dto.email, password: dto.password);
  }

  @override
  Future<void> logout() async {
    await _firebaseAuth.signOut();
  }

  @override
  Future<void> signup(AuthDto dto) async {
    final user = await _firebaseAuth.createUserWithEmailAndPassword(
        email: dto.email, password: dto.password);
    await Future.wait([
      user.user?.updateDisplayName(dto.name) ?? Future.sync(() => null),
      logCreatedUser(dto)
    ]);
  }

  static MultiStreamController<MenuUser?>? _controller;

  static final Stream<MenuUser?> _stream = Stream.multi((p0) async {
    _controller = p0;
    final firebaseStream = _firebaseAuth.userChanges();
    await for (final event in firebaseStream) {
      _controller?.add(_getUserFromFirebase(event));
    }
  });

  static MenuUser? _getUserFromFirebase(User? firebaseUser) {
    if (firebaseUser == null) return null;
    final email = firebaseUser.email!;
    final name = firebaseUser.displayName!;
    final uid = firebaseUser.uid;

    return MenuUser(name: name, uid: uid, email: email);
  }

  @override
  Stream<MenuUser?> get userChanges => _stream;

  @override
  Future<void> logCreatedUser(AuthDto dto) async {
    await _firebaseAnalytics.logSignUp(
        signUpMethod: SignupMethods.emailPassword.name);
  }
}
