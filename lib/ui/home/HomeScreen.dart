import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/ui/apptop/AppTopScreen.dart';
import 'package:flutter_app/ui/coupon/CouponScreen.dart';
import 'package:flutter_app/ui/member/MemberScreen.dart';
import 'package:flutter_app/ui/news/NewsScreen.dart';
import 'package:flutter_app/ui/qr_code/QrScreen.dart';
import 'package:flutter_app/utils/localize/AppLocalizations.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _HomeState();
  }
}

class _HomeState extends State<HomeScreen> {
  final pages = [
    AppTopScreen(
      key: PageStorageKey("Home"),
    ),
    CouponScreen(
      key: PageStorageKey("Coupon"),
    ),
    MemberScreen(
      key: PageStorageKey("Member"),
    ),
    QrScreen(
      key: PageStorageKey("Qr"),
    ),
    NewsScreen(
      key: PageStorageKey("News"),
    ),
  ];

  final bucket = PageStorageBucket();

  var _selectedIndex = 0;

  Widget _bottomNavigationBar(int selectedIndex) => BottomNavigationBar(
        showUnselectedLabels: true,
        onTap: (int index) => setState(() => _selectedIndex = index),
        currentIndex: selectedIndex,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              backgroundColor: Colors.black,
              icon: Icon(Icons.home),
              label: AppLocalization.of(context)
                      .translate("bottom_navigation_label_home") ??
                  "1"),
          BottomNavigationBarItem(
              backgroundColor: Colors.black,
              icon: Icon(Icons.contact_support_outlined),
              label: AppLocalization.of(context)
                      .translate("bottom_navigation_label_coupon") ??
                  "2"),
          BottomNavigationBarItem(
              backgroundColor: Colors.black,
              icon: Icon(Icons.people),
              label: AppLocalization.of(context)
                      .translate("bottom_navigation_label_member") ??
                  "3"),
          BottomNavigationBarItem(
              backgroundColor: Colors.black,
              icon: Icon(Icons.qr_code),
              label: AppLocalization.of(context)
                      .translate("bottom_navigation_label_qr") ??
                  "4"),
          BottomNavigationBarItem(
              backgroundColor: Colors.black,
              icon: Icon(Icons.info),
              label: AppLocalization.of(context)
                      .translate("bottom_navigation_label_new") ??
                  "5")
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: _bottomNavigationBar(_selectedIndex),
        body: PageStorage(
          child: pages[_selectedIndex],
          bucket: bucket,
        ));
  }
}
