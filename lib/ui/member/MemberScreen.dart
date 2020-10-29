import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MemberScreen extends StatefulWidget {

  const MemberScreen({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _MemberState();
  }
}


class _MemberState extends State<MemberScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.indigoAccent,
      ),
    );
  }

}