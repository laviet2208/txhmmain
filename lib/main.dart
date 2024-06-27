import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'screen/general_screen/preview_screen.dart';

Future<void> main() async
{
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: "AIzaSyD8rR43WWpD0SXDo5JHvfLWsEFxVIapXPY",
        authDomain: "america-use.firebaseapp.com",
        databaseURL: "https://america-use-default-rtdb.firebaseio.com",
        projectId: "america-use",
        storageBucket: "america-use.appspot.com",
        messagingSenderId: "289442314596",
        appId: "1:289442314596:web:30e4b745e3e0d4d7e2a271",
        measurementId: "G-39EE2VBL57"
      ),
  );

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void dispose() {
    // TODO: implement dispose
    print('Bạn đã tắt app');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Thích xài hàng Mỹ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const preview_screen(),
    );
  }
}
