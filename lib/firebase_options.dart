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
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAMpzN7dRrV-CYYq6cGT3c-KKtD0FSVlQ4',
    appId: '1:885638925797:android:4d4275060c26fb10b9b30c',
    messagingSenderId: '885638925797',
    projectId: 'health-is-wealth-9ddc1',
    databaseURL: 'https://health-is-wealth-9ddc1-default-rtdb.firebaseio.com',
    storageBucket: 'health-is-wealth-9ddc1.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD16guZkWuBPb0wjuG8XzndtQD173y0HOc',
    appId: '1:885638925797:ios:99d9640556299831b9b30c',
    messagingSenderId: '885638925797',
    projectId: 'health-is-wealth-9ddc1',
    databaseURL: 'https://health-is-wealth-9ddc1-default-rtdb.firebaseio.com',
    storageBucket: 'health-is-wealth-9ddc1.appspot.com',
    iosClientId:
        '885638925797-t5lsbcjo2tqsq6c4elpo98irrov6m926.apps.googleusercontent.com',
    iosBundleId: 'com.example.hiw',
  );
}
