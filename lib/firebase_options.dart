// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBX-znNVde8iaSFKf2LnNEnxkXN1WjrCno',
    appId: '1:381214135748:web:a1bd7a637d95f522de8091',
    messagingSenderId: '381214135748',
    projectId: 'the-menu-ceub',
    authDomain: 'the-menu-ceub.firebaseapp.com',
    storageBucket: 'the-menu-ceub.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDn-pUnPAp6jKRJsrG2pztvkujOBLlsaBg',
    appId: '1:381214135748:android:23f6508604bbfa86de8091',
    messagingSenderId: '381214135748',
    projectId: 'the-menu-ceub',
    storageBucket: 'the-menu-ceub.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDOqPvJLSunK_wk95DTkX6hUve4_33Vn_c',
    appId: '1:381214135748:ios:c6c2d320afe20c4dde8091',
    messagingSenderId: '381214135748',
    projectId: 'the-menu-ceub',
    storageBucket: 'the-menu-ceub.appspot.com',
    iosBundleId: 'com.example.theMenu',
  );
}
