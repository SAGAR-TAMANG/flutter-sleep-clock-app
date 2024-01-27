import 'package:flutter/material.dart';
import 'package:sleep_clock_app/clock_view.dart';

class HomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  @override
  Widget build (BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        color: Color(0xFF2d2f41),
        child: ClockView(),
      ),
    );
  }
}