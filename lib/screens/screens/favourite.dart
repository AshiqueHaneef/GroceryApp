import 'package:flutter/material.dart';

class favourite extends StatefulWidget {
  const favourite({ Key? key }) : super(key: key);

  @override
  _favouriteState createState() => _favouriteState();
}

class _favouriteState extends State<favourite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [Text("favourite")],
      ),
    ); 
  }
}