import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDV5WgEH9ww2iqrlaN6PnK1TYNSI15g7ZU",
            authDomain: "restoransmartsystem.firebaseapp.com",
            projectId: "restoransmartsystem",
            storageBucket: "restoransmartsystem.firebasestorage.app",
            messagingSenderId: "245958560799",
            appId: "1:245958560799:web:0be21c67eedc6da94c192a"));
  } else {
    await Firebase.initializeApp();
  }
}
