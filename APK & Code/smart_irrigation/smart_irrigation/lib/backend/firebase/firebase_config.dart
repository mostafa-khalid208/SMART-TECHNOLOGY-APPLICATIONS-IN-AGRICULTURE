import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBmAFDLob5MdZKO0LmFpde4EZvw_koYeEs",
            authDomain: "smart-irrigation-v77nzz.firebaseapp.com",
            projectId: "smart-irrigation-v77nzz",
            storageBucket: "smart-irrigation-v77nzz.appspot.com",
            messagingSenderId: "419689513259",
            appId: "1:419689513259:web:dba9966ed7c64f3a19c56e"));
  } else {
    await Firebase.initializeApp();
  }
}
