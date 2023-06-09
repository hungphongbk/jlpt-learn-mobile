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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for android - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAaEXPOSzBxwu4yH428nZF6oEdxyDXayJ4',
    appId: '1:735354557623:ios:d59045d64568ab2b30e932',
    messagingSenderId: '735354557623',
    projectId: 'jlpt-learn-acdbb',
    storageBucket: 'jlpt-learn-acdbb.appspot.com',
    iosClientId: '735354557623-mftmncgpmgu4hmrro6v1uqa2hojh2qoc.apps.googleusercontent.com',
    iosBundleId: 'com.jlptlearn.mixandmatch',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAaEXPOSzBxwu4yH428nZF6oEdxyDXayJ4',
    appId: '1:735354557623:ios:6c3a991a897af0bb30e932',
    messagingSenderId: '735354557623',
    projectId: 'jlpt-learn-acdbb',
    storageBucket: 'jlpt-learn-acdbb.appspot.com',
    iosClientId: '735354557623-ij9006d6nmvt81qt0vda86ta38b9h9k2.apps.googleusercontent.com',
    iosBundleId: 'com.jlptlearn.jlptLearn',
  );
}
