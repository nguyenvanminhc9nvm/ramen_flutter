import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/utils/constant/AppConstant.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutter_screenutil/size_extension.dart';

class AppTopScreen extends StatefulWidget {
  const AppTopScreen({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _AppTopState();
  }
}

class _AppTopState extends State<AppTopScreen> {
  final controller = PageController();

  Container _initViewPagerProductLimited() => Container(
        child: PageView(
          controller: controller,
          children: [
            Image(image: AssetImage(AppConstant.iconStart)),
            Image(image: AssetImage(AppConstant.iconStart)),
            Image(image: AssetImage(AppConstant.iconStart)),
            Image(image: AssetImage(AppConstant.iconStart)),
            Image(image: AssetImage(AppConstant.iconStart))
          ],
        ),
      );

  Container _initViewSelectOptionStore() => Container(
    margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          flex: 1,
          child: Image(image: AssetImage(AppConstant.iconStore)),
        ),
        SizedBox(width: 10),
        Expanded(
          flex: 1,
          child: Image(image: AssetImage(AppConstant.iconMenu)),
        ),
      ],
    ),
  );

  Container _initViewOpenTakeout() => Container(
        child: Image(image: AssetImage(AppConstant.iconSecond)),
      );

  Container _initViewInfoRank() => Container(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Divider(color: Colors.grey),
            ),
            Expanded(
              flex: 5,
              child: Divider(color: Colors.grey),
            ),
            Expanded(
              flex: 1,
              child: Divider(color: Colors.grey),
            ),
            Expanded(
              flex: 2,
              child: Divider(color: Colors.grey),
            ),
            Expanded(
              flex: 1,
              child: Divider(color: Colors.grey),
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: Size(750, 1334), allowFontScaling: false);
    return Scaffold(
      body: Container(
        child: Align(
          child: SafeArea(
            top: true,
            bottom: true,
            left: true,
            right: true,
            child: ListView(
              children: [
                AspectRatio(
                  aspectRatio: 1 / 1,
                  child: _initViewPagerProductLimited(),
                ),
                _initViewSelectOptionStore(),
                _initViewOpenTakeout()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
