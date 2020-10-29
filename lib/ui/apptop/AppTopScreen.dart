import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/utils/constant/AppConstant.dart';
import 'package:flutter_app/utils/localize/AppLocalizations.dart';
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

  Container _initViewSelectOptionStore(String firstImage, String secondImage) => Container(
        margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              flex: 1,
              child: Image(image: AssetImage(firstImage)),
            ),
            SizedBox(width: 10),
            Expanded(
              flex: 1,
              child: Image(image: AssetImage(secondImage)),
            ),
          ],
        ),
      );

  Container _initViewOpenTakeout() => Container(
    margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: Image(image: AssetImage(AppConstant.iconTakeout)),
      );

  Container _initViewOpenAbuRaSoBa() => Container(
    margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
    child: Image(image: AssetImage(AppConstant.iconAbuRaSoBa)),
  );

  Container _initViewOpenRequestTopping() => Container(
    margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
    child: Image(image: AssetImage(AppConstant.iconRequestTopping)),
  );

  Container _initViewOpenYoutube() => Container(
    margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
    child: Image(image: AssetImage(AppConstant.iconYoutube)),
  );

  Container _initViewOpenOnline() => Container(
    margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
    child: Image(image: AssetImage(AppConstant.iconOnlineStore)),
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
      appBar: AppBar(title: Text("Home")),
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
                _initViewSelectOptionStore(
                  AppConstant.iconMenu,
                  AppConstant.iconStore
                ),
                _initViewOpenTakeout(),
                // _initViewInfoRank(),
                 _initViewOpenAbuRaSoBa(),
                 _initViewOpenRequestTopping(),
                 _initViewOpenYoutube(),
                 _initViewOpenOnline(),
                 _initViewSelectOptionStore(
                     AppConstant.iconQuestionNaire,
                     AppConstant.iconOfficeSite
                 ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: FlatButton(
                          color: Colors.black,
                          shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(50)),
                          onPressed: () {

                          },
                          child: Text(
                            AppLocalization.of(context)
                                .translate("register_label_btn"),
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        flex: 1,
                        child: FlatButton(
                          color: Colors.black,
                          shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(50)),
                          onPressed: () {

                          },
                          child: Text(
                            AppLocalization.of(context)
                                .translate("register_label_btn"),
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
