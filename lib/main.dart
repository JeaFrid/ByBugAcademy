import 'package:opensource/page/home.dart';
import 'package:opensource/page/login.dart';
import 'package:cosmos/cosmos.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ByBug Academy',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      debugShowCheckedModeBanner: false,
      home: CosmosFirebase.isSignedIn() == true
          ? const HomePage()
          : const Login(),
    );
  }
}
