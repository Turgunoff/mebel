// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyBouYDBFDJ0OUxXP5oxHN1cA5nyKqy5yBk',
    appId: '1:710515555992:web:99243aa43ea89585155aed',
    messagingSenderId: '710515555992',
    projectId: 'mebel-uz-ff24f',
    authDomain: 'mebel-uz-ff24f.firebaseapp.com',
    storageBucket: 'mebel-uz-ff24f.appspot.com',
    measurementId: 'G-VLXYKJNLDH',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAZy-1reAmEvoNGRm3Xo0P7JoffnER_5W4',
    appId: '1:710515555992:android:cfbc9b6b209a5817155aed',
    messagingSenderId: '710515555992',
    projectId: 'mebel-uz-ff24f',
    storageBucket: 'mebel-uz-ff24f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCq8gL-nMHbvboPNE51sGRyCwZQIZgYqzc',
    appId: '1:710515555992:ios:8edc1c3dfa4be677155aed',
    messagingSenderId: '710515555992',
    projectId: 'mebel-uz-ff24f',
    storageBucket: 'mebel-uz-ff24f.appspot.com',
    iosBundleId: 'com.example.mebel',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCq8gL-nMHbvboPNE51sGRyCwZQIZgYqzc',
    appId: '1:710515555992:ios:8edc1c3dfa4be677155aed',
    messagingSenderId: '710515555992',
    projectId: 'mebel-uz-ff24f',
    storageBucket: 'mebel-uz-ff24f.appspot.com',
    iosBundleId: 'com.example.mebel',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBouYDBFDJ0OUxXP5oxHN1cA5nyKqy5yBk',
    appId: '1:710515555992:web:19045483ef2a10c2155aed',
    messagingSenderId: '710515555992',
    projectId: 'mebel-uz-ff24f',
    authDomain: 'mebel-uz-ff24f.firebaseapp.com',
    storageBucket: 'mebel-uz-ff24f.appspot.com',
    measurementId: 'G-RKSSQN6QVH',
  );
}
