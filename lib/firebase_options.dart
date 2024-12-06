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
    apiKey: 'AIzaSyDN1BJUfrAzfOkpWEVJJre3EgCMJKcIxMc',
    appId: '1:381514409672:web:b405a2d7fb35ee51e527fd',
    messagingSenderId: '381514409672',
    projectId: 'mio-1-610e1',
    authDomain: 'mio-1-610e1.firebaseapp.com',
    storageBucket: 'mio-1-610e1.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAf18HJ2OJ4BxYNGe5ygL8Zow2WU7oEFkk',
    appId: '1:381514409672:android:00a2e44391d2e940e527fd',
    messagingSenderId: '381514409672',
    projectId: 'mio-1-610e1',
    storageBucket: 'mio-1-610e1.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD3yK7d6liVhutpTi6Xvhh3lJOi-y6eXkg',
    appId: '1:381514409672:ios:a5470fe1cf28492ae527fd',
    messagingSenderId: '381514409672',
    projectId: 'mio-1-610e1',
    storageBucket: 'mio-1-610e1.appspot.com',
    iosBundleId: 'com.example.mio1',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD3yK7d6liVhutpTi6Xvhh3lJOi-y6eXkg',
    appId: '1:381514409672:ios:a5470fe1cf28492ae527fd',
    messagingSenderId: '381514409672',
    projectId: 'mio-1-610e1',
    storageBucket: 'mio-1-610e1.appspot.com',
    iosBundleId: 'com.example.mio1',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDN1BJUfrAzfOkpWEVJJre3EgCMJKcIxMc',
    appId: '1:381514409672:web:cd45c688bf6f38d3e527fd',
    messagingSenderId: '381514409672',
    projectId: 'mio-1-610e1',
    authDomain: 'mio-1-610e1.firebaseapp.com',
    storageBucket: 'mio-1-610e1.appspot.com',
  );
}
