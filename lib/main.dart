import 'package:flutter/material.dart';
import 'package:posts/core/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Posts App',
      theme: appTheme,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Posts',style: TextStyle(color: Colors.white),),
        ),
        body: const Center(
          child: Text('Posts App'),
        ),
      ),
    );
  }
}
