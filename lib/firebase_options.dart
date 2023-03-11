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
    apiKey: 'AIzaSyBTpw3v7spuPhk2LSD9OtDbT_pmNh58D7U',
    appId: '1:749182420934:web:560e7262964cffde2bd4c7',
    messagingSenderId: '749182420934',
    projectId: 'qr-app-40bda',
    authDomain: 'qr-app-40bda.firebaseapp.com',
    storageBucket: 'qr-app-40bda.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB4qQHEiZ521a8NbKTEQ3iuowa04XUzPK8',
    appId: '1:749182420934:android:dcc4d25011a3939a2bd4c7',
    messagingSenderId: '749182420934',
    projectId: 'qr-app-40bda',
    storageBucket: 'qr-app-40bda.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDeZNjR_cVlSU34Mr1CM2EhWtY9SZnlETg',
    appId: '1:749182420934:ios:856b093da3cb56da2bd4c7',
    messagingSenderId: '749182420934',
    projectId: 'qr-app-40bda',
    storageBucket: 'qr-app-40bda.appspot.com',
    iosClientId: '749182420934-qn0u56leuaqclf117rqfj1cedhpoh2a9.apps.googleusercontent.com',
    iosBundleId: 'com.example.qrApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDeZNjR_cVlSU34Mr1CM2EhWtY9SZnlETg',
    appId: '1:749182420934:ios:856b093da3cb56da2bd4c7',
    messagingSenderId: '749182420934',
    projectId: 'qr-app-40bda',
    storageBucket: 'qr-app-40bda.appspot.com',
    iosClientId: '749182420934-qn0u56leuaqclf117rqfj1cedhpoh2a9.apps.googleusercontent.com',
    iosBundleId: 'com.example.qrApp',
  );
}