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
        return macos;
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
    apiKey: 'AIzaSyDyJ-r6LkqWaSzWTkr-v0r2_WmL3UGppJY',
    appId: '1:304324993484:web:30c92c5fc4a6e6bd313d69',
    messagingSenderId: '304324993484',
    projectId: 'tobetoappv2',
    authDomain: 'tobetoappv2.firebaseapp.com',
    storageBucket: 'tobetoappv2.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAuP9OCB3JQwyufkUT9rsksX_6a2j2xqow',
    appId: '1:304324993484:android:a6f155d0a627c632313d69',
    messagingSenderId: '304324993484',
    projectId: 'tobetoappv2',
    storageBucket: 'tobetoappv2.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA3uIQvtzNjY6pnZ9VGAfmpc5-wGyoOj7c',
    appId: '1:304324993484:ios:b77013596429c3db313d69',
    messagingSenderId: '304324993484',
    projectId: 'tobetoappv2',
    storageBucket: 'tobetoappv2.appspot.com',
    iosBundleId: 'com.example.tobetoappV2',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA3uIQvtzNjY6pnZ9VGAfmpc5-wGyoOj7c',
    appId: '1:304324993484:ios:73f40031a0de8c26313d69',
    messagingSenderId: '304324993484',
    projectId: 'tobetoappv2',
    storageBucket: 'tobetoappv2.appspot.com',
    iosBundleId: 'com.example.tobetoappV2.RunnerTests',
  );
}
