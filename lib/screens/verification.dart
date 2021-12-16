// ignore_for_file: camel_case_types

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:grocery1/screens/location.dart';
import 'package:grocery1/screens/login_screen.dart';

class verification extends StatelessWidget {
  const verification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              "Enter your 4 digit code",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
            const verificationCodeForm(),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Resend Code",
                  ),
                ),
                RawMaterialButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const loginscreen()));
                  },
                  elevation: 1.0,
                  fillColor: Colors.teal,
                  child: const Icon(
                    Icons.arrow_forward_ios,
                    size: 35.0,
                    color: Colors.white,
                  ),
                  padding: const EdgeInsets.all(15.0),
                  shape: const CircleBorder(),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class verificationCodeForm extends StatefulWidget {
  const verificationCodeForm({Key? key}) : super(key: key);
  @override
  _verificationCodeFormState createState() => _verificationCodeFormState();
}

// ignore: camel_case_types
class _verificationCodeFormState extends State<verificationCodeForm> {
  late FocusNode point2focusnode;
  late FocusNode point3focusnode;
  late FocusNode point4focusnode;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    point2focusnode = FocusNode();
    point3focusnode = FocusNode();
    point4focusnode = FocusNode();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    point2focusnode.dispose();
    point3focusnode.dispose();
    point4focusnode.dispose();
  }

  void nextField({required String value, required FocusNode focusNode}) {
    // ignore: unrelated_type_equality_checks
    if (value.length == 1) {
      focusNode.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 60,
            child: TextFormField(
              autofocus: true,
              textAlign: TextAlign.center,
              obscureText: true,
              style: const TextStyle(
                fontSize: 20,
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                nextField(value: value, focusNode: point2focusnode);
              },
            ),
          ),
          SizedBox(
            width: 60,
            child: TextFormField(
              focusNode: point2focusnode,
              autofocus: true,
              textAlign: TextAlign.center,
              obscureText: true,
              style: const TextStyle(
                fontSize: 20,
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                nextField(value: value, focusNode: point3focusnode);
              },
            ),
          ),
          SizedBox(
            width: 60,
            child: TextFormField(
              focusNode: point3focusnode,
              autofocus: true,
              textAlign: TextAlign.center,
              obscureText: true,
              style: const TextStyle(
                fontSize: 20,
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                nextField(value: value, focusNode: point4focusnode);
              },
            ),
          ),
          SizedBox(
            width: 60,
            child: TextFormField(
              focusNode: point4focusnode,
              autofocus: true,
              textAlign: TextAlign.center,
              obscureText: true,
              style: const TextStyle(
                fontSize: 20,
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                point4focusnode.unfocus();
              },
            ),
          ),
        ],
      ),
    );
  }
}
