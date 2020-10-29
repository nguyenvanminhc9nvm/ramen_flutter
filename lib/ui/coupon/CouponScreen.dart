import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CouponScreen extends StatefulWidget {

  const CouponScreen({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _CouponState();
  }
}


class _CouponState extends State<CouponScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.yellow,
      ),
    );
  }

}