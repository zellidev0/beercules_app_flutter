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
    apiKey: 'AIzaSyDerLDfaiC6c8JrvcOyDrHOHsZg3Wsi5c8',
    appId: '1:95241181319:web:d037aa7b748707f5b50022',
    messagingSenderId: '95241181319',
    projectId: 'beercules-trinkspiel',
    authDomain: 'beercules-trinkspiel.firebaseapp.com',
    databaseURL: 'https://beercules-trinkspiel.firebaseio.com',
    storageBucket: 'beercules-trinkspiel.appspot.com',
    measurementId: 'G-TB0KKFH7WW',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD2PMls4ztksBWJO7-4wE-Q4mIs92S9dhk',
    appId: '1:95241181319:android:31951af88c22e98f',
    messagingSenderId: '95241181319',
    projectId: 'beercules-trinkspiel',
    databaseURL: 'https://beercules-trinkspiel.firebaseio.com',
    storageBucket: 'beercules-trinkspiel.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBWHXUV5HReXl5VB-TYuWcue7naPSCr_m0',
    appId: '1:95241181319:ios:6803b2bb80c15dd6',
    messagingSenderId: '95241181319',
    projectId: 'beercules-trinkspiel',
    databaseURL: 'https://beercules-trinkspiel.firebaseio.com',
    storageBucket: 'beercules-trinkspiel.appspot.com',
    iosClientId: '95241181319-qvoamur49rnafljptqr58otvcr4vni7a.apps.googleusercontent.com',
    iosBundleId: 'com.zellnapps.beercules',
  );
}