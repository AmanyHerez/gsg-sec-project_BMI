import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  String text;

  HomeScreen({required this.text});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI'),
      ),
      body: Text(text,style: TextStyle(fontSize: 30),),
    );
  }
}
