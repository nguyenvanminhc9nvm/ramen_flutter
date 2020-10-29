import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/ui/register/RegisterScreen.dart';
import 'package:flutter_app/utils/constant/AppConstant.dart';
import 'package:flutter_app/utils/localize/AppLocalizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IntroScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _IntroScreenState();
  }
}

class _IntroScreenState extends State<IntroScreen> {
  final controller = PageController(initialPage: 0, keepPage: true);

  Container _createItem(
          String number,
          String image,
          String introTitle,
          String introContent,
          double fontTitle,
          double fontSizeContent,
          bool visibleButton) =>
      Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AppConstant.iconIntro), fit: BoxFit.cover)),
        child: Align(
          child: SafeArea(
            top: true,
            left: true,
            bottom: true,
            right: true,
            minimum: EdgeInsets.all(16.0),
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: createViewHeader(number),
                ),
                Expanded(
                  flex: 5,
                  child: Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: createButton(false, AppConstant.iconPrevious)),
                      Expanded(flex: 8, child: createViewImage(image)),
                      Expanded(
                          flex: 1,
                          child: createButton(true, AppConstant.iconNext))
                    ],
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: createViewTitle(
                        introTitle, Alignment.center, fontTitle)),
                Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        createViewContent(
                            introContent, Alignment.topCenter, fontSizeContent),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                          child: Visibility(
                              visible: visibleButton,
                              child: FlatButton(
                                color: Colors.white,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(15, 0, 15, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [Icon(Icons.close), Text("閉じる")],
                                  ),
                                ),
                                onPressed: () => {
                                  AppConstant.replace(context, AppConstant.registerScreen)
                                },
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: Colors.black,
                                        width: 1,
                                        style: BorderStyle.solid),
                                    borderRadius: BorderRadius.circular(50)),
                              )),
                        ),
                      ],
                    )),
              ],
            ),
          ),
        ),
      );

  GestureDetector createButton(bool isNext, String icon) => GestureDetector(
        child: Image(
          image: AssetImage(icon),
          width: 42.sp,
          height: 55.sp,
        ),
        onTap: () => {
          if (isNext)
            {
              controller.nextPage(
                  duration: Duration(milliseconds: 300), curve: Curves.linear),
            }
          else
            {
              controller.previousPage(
                  duration: Duration(milliseconds: 300), curve: Curves.linear),
            }
        },
      );

  Align createViewTitle(
          String introTitle, Alignment alignment, double fontSize) =>
      Align(
        alignment: alignment,
        child: Text(introTitle,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: fontSize,
                fontFamily: AppConstant.fontHanSansMedium,
                decoration: TextDecoration.underline,
                decorationThickness: 4,
                decorationStyle: TextDecorationStyle.solid,
                decorationColor: Colors.yellow)),
      );

  Align createViewContent(
          String introTitle, Alignment alignment, double fontSize) =>
      Align(
        alignment: alignment,
        child: Text(
          introTitle,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: fontSize,
            fontFamily: AppConstant.fontHanSansMedium,
          ),
        ),
      );

  Image createViewImage(String image) => Image(
        image: AssetImage(image),
      );

  /// create view has number
  Container createViewHeader(String number) => Container(
        margin: EdgeInsets.fromLTRB(16.0, 16.0, 0, 0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(
              "#",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 60.sp,
                  fontFamily: AppConstant.fontMyriad),
            ),
            Text(
              number,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 73.sp,
                  fontFamily: AppConstant.fontBeBas),
            )
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: Size(750, 1334), allowFontScaling: false);
    // TODO: implement build

    return Scaffold(
      body: PageView(
        controller: controller,
        children: [
          _createItem(
              "01",
              AppConstant.iconStart,
              AppLocalization.of(context).translate("intro_title_first"),
              AppLocalization.of(context).translate("intro_content_first"),
              54.sp,
              32.sp,
              false),
          _createItem(
              "02",
              AppConstant.iconSecond,
              AppLocalization.of(context).translate("intro_title_second"),
              AppLocalization.of(context).translate("intro_content_second"),
              42.sp,
              32.sp,
              false),
          _createItem(
              "03",
              AppConstant.iconThird,
              AppLocalization.of(context).translate("intro_title_third"),
              AppLocalization.of(context).translate("intro_content_third"),
              42.sp,
              32.sp,
              false),
          _createItem(
              "04",
              AppConstant.iconFour,
              AppLocalization.of(context).translate("intro_title_four"),
              AppLocalization.of(context).translate("intro_content_four"),
              36.sp,
              28.sp,
              false),
          _createItem(
              "05",
              AppConstant.iconFive,
              AppLocalization.of(context).translate("intro_title_five"),
              AppLocalization.of(context).translate("intro_content_five"),
              39.sp,
              28.sp,
              false),
          _createItem(
              "06",
              AppConstant.iconSix,
              AppLocalization.of(context).translate("intro_title_six"),
              "",
              42.sp,
              0,
              true)
        ],
      ),
    );
  }
}
