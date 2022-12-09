import 'package:cornie_app/screens/dashboard/dashboard.dart';
import 'package:flutter/material.dart';

int initScreen = 0;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: FirebaseOptions(
  //     apiKey: "AIzaSyBoAzXL9GUY6royKhZ2ZiNQLTRCt69ALWQ",
  //     appId: "1:1055369430536:web:75f1246a2b92647a49b3bd",
  //     messagingSenderId: "1055369430536",
  //     projectId: "binkstoreapp",
  //   ),
  // );
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
        'onboarding': (context) => const AtDashboardScreen(),
        // sizeLayout()
        'dashboard': (context) => const AtDashboardScreen(),
      },
    );
  }
}
