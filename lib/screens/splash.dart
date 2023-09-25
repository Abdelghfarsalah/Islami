import 'package:flutter/material.dart';
import 'package:islam/screens/home/home.dart';
import 'package:islam/utils/functions.dart';
import 'package:lottie/lottie.dart';

class splash extends StatefulWidget {
  const splash({super.key});

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  void initState() {
    super.initState();
    gotohome();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(),
        child: Center(
          child: Lottie.asset('assets/animations/data.json'),
        ),
      ),
    );
  }

  void gotohome() {
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>const home()), (route) => false);
    });
  }
}
