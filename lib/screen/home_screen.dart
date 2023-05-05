import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        elevation: 2,
        title: Text("오늘의 웹툰",
        style: TextStyle(fontSize: 24,
        fontWeight: FontWeight.w400,),
        ),
      ),
    );
  }
}
