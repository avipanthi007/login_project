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
    apiKey: 'AIzaSyBLPXd_lJgFNkK5gxvV8zP7TphC-GjLhxM',
    appId: '1:810278346631:web:a0568a7c276a72f0007d22',
    messagingSenderId: '810278346631',
    projectId: 'loginproject-57118',
    authDomain: 'loginproject-57118.firebaseapp.com',
    storageBucket: 'loginproject-57118.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBT3fHegn5W7wis4JrWPbbx3V2vWISslIM',
    appId: '1:810278346631:android:c65324f861064407007d22',
    messagingSenderId: '810278346631',
    projectId: 'loginproject-57118',
    storageBucket: 'loginproject-57118.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDKH5LbxcSo25IKzm-EKEF9XXahjPO7u4U',
    appId: '1:810278346631:ios:9e299ca4176faf38007d22',
    messagingSenderId: '810278346631',
    projectId: 'loginproject-57118',
    storageBucket: 'loginproject-57118.appspot.com',
    iosBundleId: 'com.example.loginProject',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDKH5LbxcSo25IKzm-EKEF9XXahjPO7u4U',
    appId: '1:810278346631:ios:9e299ca4176faf38007d22',
    messagingSenderId: '810278346631',
    projectId: 'loginproject-57118',
    storageBucket: 'loginproject-57118.appspot.com',
    iosBundleId: 'com.example.loginProject',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBLPXd_lJgFNkK5gxvV8zP7TphC-GjLhxM',
    appId: '1:810278346631:web:67b3a13000bfa2df007d22',
    messagingSenderId: '810278346631',
    projectId: 'loginproject-57118',
    authDomain: 'loginproject-57118.firebaseapp.com',
    storageBucket: 'loginproject-57118.appspot.com',
  );
}
