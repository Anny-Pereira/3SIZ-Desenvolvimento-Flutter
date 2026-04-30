// firebase_options.dart (resumo)
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) return web;
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.windows:
        return windows;
      default:
        throw UnsupportedError('Plataforma nao suportada.');
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: "AIzaSyD4LXck9BTKHRtFs-Hq7Gp8Zjrvw1LgZew",
    authDomain: "projetofirebase-5d7e2.firebaseapp.com",
    projectId: "projetofirebase-5d7e2",
    storageBucket: "projetofirebase-5d7e2.firebasestorage.app",
    messagingSenderId: "882738828035",
    appId: "1:882738828035:web:f3929f1e4334f619a4cf36",
    measurementId: "G-DWHP4YDZFH",
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'ANDROID_API_KEY',
    appId: 'ANDROID_APP_ID',
    messagingSenderId: 'MESSAGING_SENDER_ID',
    projectId: 'PROJECT_ID',
    storageBucket: 'PROJECT_ID.firebasestorage.app',
  );

  static const FirebaseOptions windows = web;
}
