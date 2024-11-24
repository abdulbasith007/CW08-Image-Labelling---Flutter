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
    apiKey: 'AIzaSyAbH1MWoCV5BimcS3h9ZIzqAq83KvPZoxI',
    appId: '1:115534077800:web:ba039967y2018a8f6d80dd',
    messagingSenderId: '115534077800',
    projectId: 'cw-06-assignment',
    authDomain: 'cw-06-assignment.firebaseapp.com',
    storageBucket: 'cw-06-assignment.firebasestorage.app',
    measurementId: 'G-EENKNTQVW0',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCzoyFA_0IP_H78y4JMeT2-VI-692dMEIc',
    appId: '1:115534077800:android:6d4ehk54ad1daf346d80dd',
    messagingSenderId: '115534077800',
    projectId: 'cw-06-assignment',
    storageBucket: 'cw-06-assignment.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBDpj_LB2od9i3Hg9i9cRTaG9lqIOrVewQ',
    appId: '1:115534077800:ios:660509804d402b6c6d80dd',
    messagingSenderId: '115534077800',
    projectId: 'cw-06-assignment',
    storageBucket: 'cw-06-assignment.firebasestorage.app',
    iosBundleId: 'com.example.imagelabelingFirebasemlCw08',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBDpj_LB2od9i3HgHE9cGHaG9lqIOrVewQ',
    appId: '1:115534077800:ios:660570804y802b6c6d80dd',
    messagingSenderId: '115534077800',
    projectId: 'cw-06-assignment',
    storageBucket: 'cw-06-assignment.firebasestorage.app',
    iosBundleId: 'com.example.imagelabelingFirebasemlCw08',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAbH1MWoCV5BimcS3wHIIzqAq83KvPZoxI',
    appId: '1:115534077800:web:ceea6e5fahg303966d80dd',
    messagingSenderId: '115534077800',
    projectId: 'cw-06-assignment',
    authDomain: 'cw-06-assignment.firebaseapp.com',
    storageBucket: 'cw-06-assignment.firebasestorage.app',
    measurementId: 'G-CF7Q5MTQ84',
  );
}