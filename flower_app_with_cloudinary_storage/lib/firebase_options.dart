import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) return web;
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      default:
        return web;
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBigvp6ZhTLLk374bGFMII2EC-XHkKfDvk',
    appId: '1:6601123849:web:64442c9a933636785870d8',
    messagingSenderId: '6601123849',
    projectId: 'flower-app-78f23',
    authDomain: 'flower-app-78f23.firebaseapp.com',
    storageBucket: 'flower-app-78f23.firebasestorage.app',
    measurementId: 'G-K1RK6RF5KZ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBigvp6ZhTLLk374bGFMII2EC-XHkKfDvk',
    appId: '1:6601123849:android:64442c9a933636785870d8',
    messagingSenderId: '6601123849',
    projectId: 'flower-app-78f23',
    storageBucket: 'flower-app-78f23.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBigvp6ZhTLLk374bGFMII2EC-XHkKfDvk',
    appId: '1:6601123849:ios:64442c9a933636785870d8',
    messagingSenderId: '6601123849',
    projectId: 'flower-app-78f23',
    storageBucket: 'flower-app-78f23.firebasestorage.app',
  );
}
