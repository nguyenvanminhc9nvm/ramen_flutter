import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/utils/constant/AppConstant.dart';


class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
  startTime() async {
    var _duration = Duration(seconds: 2);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() {
    AppConstant.replace(context, AppConstant.introScreen);
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/icon_bg_history.png"),
            fit: BoxFit.cover
          ),
        ),
        child: Center(
          child: Image.asset("assets/image_splash_icon.png"),
        ),
      )
    );
  }
  
}