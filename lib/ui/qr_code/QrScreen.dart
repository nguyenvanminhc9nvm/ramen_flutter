import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QrScreen extends StatefulWidget {

  const QrScreen({Key key}) : super(key: key);


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _QrState();
  }
}


class _QrState extends State<QrScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.purpleAccent,
      ),
    );
  }

}