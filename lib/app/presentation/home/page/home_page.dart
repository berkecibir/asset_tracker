import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static String id = 'Home';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text('Home Page'),
      ),
    );
  }
}
