import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyB2sO2ZevmF6iQu5YL6NLY2viYr6tXVBcI",
            authDomain: "hotel-book-d3ed1.firebaseapp.com",
            projectId: "hotel-book-d3ed1",
            storageBucket: "hotel-book-d3ed1.appspot.com",
            messagingSenderId: "387963460511",
            appId: "1:387963460511:web:b7771257240d5716c07baa"));
  } else {
    await Firebase.initializeApp();
  }
}
