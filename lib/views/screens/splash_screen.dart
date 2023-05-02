import 'dart:async';
import 'package:eminds_app/views/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:eminds_app/data/repositories/navigate.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> implements INavigate {

  Color myHexColor = const Color(0xff06D6A0);

  timer() async {
    var duration = const Duration(seconds: 6);
    return Timer(duration, route);
  }

  @override
  route() {
    Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) => Login())
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    timer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myHexColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 250, width: 250,
                child: Image.asset("assets/logo.jpg")),
            const Padding(padding: EdgeInsets.only(top: 20.0)),
            const CircularProgressIndicator(
              backgroundColor: Colors.white,
              strokeWidth: 1,
            ),
          ],
        ),
      ),
    );
  }
}