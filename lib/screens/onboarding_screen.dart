import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:grocery1/screens/login.dart';
import 'package:grocery1/screens/onboardingscreen2.dart';

// ignore: camel_case_types
class onboardingscreen extends StatefulWidget {
  const onboardingscreen({Key? key}) : super(key: key);

  @override
  _onboardingscreenState createState() => _onboardingscreenState();
}

class _onboardingscreenState extends State<onboardingscreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 3), openscreen);
    // Timer(const Duration(seconds: 5), openscreen);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              height: 250,
              width: 250,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/evamartback.png'),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void openscreen() {
    //Future.delayed(const Duration(seconds: 5));
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const onboardingscreen2()));
  }
}
