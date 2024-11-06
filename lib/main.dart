import 'package:flutter/material.dart';
import '../screen/login.dart'; // Impor LoginScreen

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const LoginScreen(), // Menjadikan LoginScreen sebagai halaman awal
      debugShowCheckedModeBanner: false, // Menghilangkan label debug
    );
  }
}
