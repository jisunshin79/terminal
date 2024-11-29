import 'package:flutter/material.dart';
import 'screens/s_HomeScreen.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '스윗홈',
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}
