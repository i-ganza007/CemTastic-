import 'package:flutter/material.dart';
import 'dart:async';
import '../Screens/Init.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 4000), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const Init(), 
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Color(0xCFCCD6), 
      body: Center(
        child: Image(
          image: AssetImage('assets/images/cemento.jpg'),
          width: 350, 
          height: 350, 
        ),
      ),
    );
  }
}