import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.windows:
        return windows;
      default:
        return web;
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: "AIzaSyBGPPgBebGmwkBtv9GiFhEaTpSln7s3r3s",
  authDomain: "tpass-9539f.firebaseapp.com",
  projectId: "tpass-9539f",
  storageBucket: "tpass-9539f.firebasestorage.app",
  messagingSenderId: "685445539456",
  appId: "1:685445539456:web:a5b95c438356a9c76d2865",
  measurementId: "G-6X9XP94FN9",
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: "AIzaSyBGPPgBebGmwkBtv9GiFhEaTpSln7s3r3s",
  authDomain: "tpass-9539f.firebaseapp.com",
  projectId: "tpass-9539f",
  storageBucket: "tpass-9539f.firebasestorage.app",
  messagingSenderId: "685445539456",
  appId: "1:685445539456:web:a5b95c438356a9c76d2865",
  measurementId: "G-6X9XP94FN9",
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: "AIzaSyBGPPgBebGmwkBtv9GiFhEaTpSln7s3r3s",
  authDomain: "tpass-9539f.firebaseapp.com",
  projectId: "tpass-9539f",
  storageBucket: "tpass-9539f.firebasestorage.app",
  messagingSenderId: "685445539456",
  appId: "1:685445539456:web:a5b95c438356a9c76d2865",
  measurementId: "G-6X9XP94FN9",
  );
}
