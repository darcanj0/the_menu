import 'package:the_menu/models/dtos/auth_dto.dart';
import 'package:the_menu/models/user.dart';
import 'package:the_menu/services/auth_firebase_service.dart';

abstract class IAuthService {
  Stream<MenuUser?> get userChanges;

  Future<void> signup(AuthDto dto);
  Future<void> login(AuthDto dto);
  Future<void> logout();
  Future<void> logCreatedUser(AuthDto dto);

  factory IAuthService() => AuthFirebaseService();
}

enum SignupMethods { emailPassword, google }
