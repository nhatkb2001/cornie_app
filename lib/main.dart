import 'package:cornie_app/screens/booking/seatScreen.dart';
import 'package:cornie_app/screens/dashboard/dashboard.dart';
import 'package:cornie_app/screens/detail/detailMovie.dart';
import 'package:cornie_app/screens/navigation/navigation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

int initScreen = 0;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: 'AIzaSyCVIAr1EU9bHrk6zOBGMEA7PE_Qrf6RaeI',
      appId: '1:602307828276:web:2057b60c9286df83b60861',
      messagingSenderId: '602307828276',
      projectId: 'cornieproject',
      authDomain: 'cornieproject.firebaseapp.com',
      storageBucket: 'cornieproject.appspot.com',
      measurementId: 'G-WS3G48K1YP',
    ),
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cornie Studio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        dialogBackgroundColor: Colors.white,
        primarySwatch: Colors.grey,
        fontFamily: 'Recoleta',
        accentColor: Colors.white,
      ),
      initialRoute: initScreen == 0 ? 'onboarding' : 'dashboard',
      routes: {
        'onboarding': (context) => const Navigation(),
        'dashboard': (context) => const Navigation()
      },
    );
  }
}
