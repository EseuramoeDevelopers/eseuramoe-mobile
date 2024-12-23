
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyACsX_fCSmdG3oE4T0n9yBIwcLiJxoJRQE',
    appId: '1:1042199076144:web:5d7e67ac1c8ac70f21fcf5',
    messagingSenderId: '1042199076144',
    projectId: 'eseuramoe',
    authDomain: 'eseuramoe.firebaseapp.com',
    storageBucket: 'eseuramoe.firebasestorage.app',
    measurementId: 'G-87607CRCHQ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAJ6TkBTc6tfTT_0vXQeZgny9ItaELmrL0',
    appId: '1:1042199076144:android:12af2f5db8b072cc21fcf5',
    messagingSenderId: '1042199076144',
    projectId: 'eseuramoe',
    storageBucket: 'eseuramoe.firebasestorage.app',
  );
}
