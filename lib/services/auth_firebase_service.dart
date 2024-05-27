import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:the_menu/models/dtos/auth_dto.dart';
import 'package:the_menu/models/user.dart';
import 'package:the_menu/services/i_auth_service.dart';

class AuthFirebaseService implements IAuthService {
  AuthFirebaseService();

  static final _firebase = FirebaseAuth.instance;

  @override
  Future<void> login(AuthDto dto) async {
    await _firebase.signInWithEmailAndPassword(
        email: dto.email, password: dto.password);
  }

  @override
  Future<void> logout() async {
    await _firebase.signOut();
  }

  @override
  Future<void> signup(AuthDto dto) async {
    final user = await _firebase.createUserWithEmailAndPassword(
        email: dto.email, password: dto.password);
    await user.user?.updateDisplayName(dto.name);
  }

  static MultiStreamController<MenuUser?>? _controller;

  static final Stream<MenuUser?> _stream = Stream.multi((p0) async {
    _controller = p0;
    final firebaseStream = _firebase.userChanges();
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
}
