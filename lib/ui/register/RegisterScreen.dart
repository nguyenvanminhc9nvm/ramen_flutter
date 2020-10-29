import 'dart:ffi';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/data/model/Prefectures.dart';
import 'package:flutter_app/ui/home/HomeScreen.dart';
import 'package:flutter_app/utils/constant/AppConstant.dart';
import 'package:flutter_app/utils/localize/AppLocalizations.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:flutter_app/utils/extensions/extensions.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _RegisterState();
  }
}

class _RegisterState extends State<RegisterScreen> {
  var textResult = "";
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final rePasswordController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneController = TextEditingController();
  final postalCodeController = TextEditingController();
  final prefecturesController = TextEditingController();
  final addressController = TextEditingController();
  final cityController = TextEditingController();

  List<Prefectures> _prefectures = [
    Prefectures("Minhnv ${Random.secure().nextInt(100)}"),
    Prefectures("Minhnv ${Random.secure().nextInt(100)}"),
    Prefectures("Minhnv ${Random.secure().nextInt(100)}"),
    Prefectures("Minhnv ${Random.secure().nextInt(100)}"),
    Prefectures("Minhnv ${Random.secure().nextInt(100)}"),
    Prefectures("Minhnv ${Random.secure().nextInt(100)}"),
    Prefectures("Minhnv ${Random.secure().nextInt(100)}"),
    Prefectures("Minhnv ${Random.secure().nextInt(100)}"),
    Prefectures("Minhnv ${Random.secure().nextInt(100)}"),
    Prefectures("Minhnv ${Random.secure().nextInt(100)}"),
    Prefectures("Minhnv ${Random.secure().nextInt(100)}")
  ];

  List<DropdownMenuItem<Prefectures>> _dropDownMenuItems;
  Prefectures _selectedItem;

  void initState() {
    super.initState();
    _dropDownMenuItems = buildDropDownMenuItems(_prefectures);
    _selectedItem = _dropDownMenuItems[0].value;
  }

  List<DropdownMenuItem<Prefectures>> buildDropDownMenuItems(List listItems) {
    List<DropdownMenuItem<Prefectures>> items = [];
    for (Prefectures listItem in listItems) {
      items.add(
        DropdownMenuItem(
          child: Text(listItem.prefName),
          value: listItem,
        ),
      );
    }
    return items;
  }

  Container _initTitleBar(String title) => Container(
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: GestureDetector(
                onTap: () {
                  triggerBack();
                },
                child:Image(
                  image: AssetImage(AppConstant.iconArrow),
                  width: 120.sp,
                  height: 100.sp,
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Text(
                  title,
                  style: TextStyle(
                      fontFamily: AppConstant.fontHanSansMedium,
                      fontSize: 49.sp),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Expanded(flex: 2, child: Text("")),
          ],
        ),
      );

  Container _initContent(String content) => Container(
        padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
        child: Text(
          content,
          style: TextStyle(
              fontFamily: AppConstant.fontHanSansMedium, fontSize: 28.sp),
          textAlign: TextAlign.center,
        ),
      );

  Container _initTextRequire(String title) => Container(
        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
        child: Row(
          children: [
            Text(
              title,
              style: TextStyle(fontFamily: AppConstant.fontHanSansNormal),
            ),
            SizedBox(width: 10),
            Text(
              "　必須　",
              style:
                  TextStyle(backgroundColor: Colors.red, color: Colors.white),
            )
          ],
        ),
      );

  Container _initEditText(
          String label, TextEditingController editingController) =>
      Container(
        margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
        child: Column(
          children: [
            _initTextRequire(label),
            Container(
              height: 80.sp,
              child: TextField(
                controller: editingController,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      );

  Container _initEditTextRow(
          String labelFirst,
          String labelSecond,
          TextEditingController editingController,
          TextEditingController editingController2) =>
      Container(
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: _initEditText(labelFirst, editingController),
            ),
            Expanded(
              flex: 1,
              child: _initEditText(labelSecond, editingController2),
            )
          ],
        ),
      );

  Container _initSingleSpinner(String label) => Container(
        margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
        child: Column(
          children: [
            _initTextRequire(label),
            Container(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5), border: Border.all()),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  value: _selectedItem,
                  items: _dropDownMenuItems,
                  onChanged: (value) {
                    setState(() {
                      _selectedItem = value;
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      );

  Container _initViewSelectTime(String label, String value) => Container(
        child: GestureDetector(
          onTap: () {
            triggerOpenCalendar();
          },
          child: Row(
            children: [
              Expanded(
                flex: 8,
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all()),
                  child: Text(value),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                flex: 2,
                child: Text(
                  label,
                  style: TextStyle(fontFamily: AppConstant.fontHanSansNormal),
                ),
              ),
            ],
          ),
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
            left: true,
            bottom: true,
            right: true,
            child: ListView(
              padding: EdgeInsets.all(8),
              children: [
                _initTitleBar(
                    AppLocalization.of(context).translate("register_title")),
                _initContent(
                    AppLocalization.of(context).translate("sign_up_title")),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: _initEditText(
                      AppLocalization.of(context)
                          .translate("register_label_email"),
                      emailController),
                ),
                _initEditText(
                    AppLocalization.of(context)
                        .translate("register_label_password"),
                    passwordController),
                _initEditText(
                    AppLocalization.of(context)
                        .translate("register_label_re_pass"),
                    rePasswordController),
                _initEditTextRow(
                    AppLocalization.of(context)
                        .translate("register_label_first_name"),
                    AppLocalization.of(context)
                        .translate("register_label_last_name"),
                    firstNameController,
                    lastNameController),
                _initEditText(
                    AppLocalization.of(context)
                        .translate("register_label_password"),
                    phoneController),
                _initEditTextRow(
                    AppLocalization.of(context)
                        .translate("register_label_postal_code"),
                    AppLocalization.of(context)
                        .translate("register_label_prefectures"),
                    postalCodeController,
                    prefecturesController),
                _initEditText(
                    AppLocalization.of(context)
                        .translate("register_label_city"),
                    cityController),
                _initEditText(
                    AppLocalization.of(context)
                        .translate("register_label_address"),
                    addressController),
                _initSingleSpinner(AppLocalization.of(context)
                    .translate("register_label_address")),
                Container(
                  margin: EdgeInsets.fromLTRB(20, 10, 0, 0),
                  child: Column(
                    children: [
                      _initTextRequire(AppLocalization.of(context)
                          .translate("register_label_select_date")),
                      Row(
                        children: [
                          Expanded(
                            flex: 4,
                            child: _initViewSelectTime(
                                AppLocalization.of(context)
                                    .translate("register_label_day"),
                                selectedDate.day.toString()),
                          ),
                          Expanded(
                            flex: 3,
                            child: _initViewSelectTime(
                                AppLocalization.of(context)
                                    .translate("register_label_day"),
                                selectedDate.month.toString()),
                          ),
                          Expanded(
                            flex: 3,
                            child: _initViewSelectTime(
                                AppLocalization.of(context)
                                    .translate("register_label_year"),
                                selectedDate.year.toString()),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                _initSingleSpinner(AppLocalization.of(context)
                    .translate("register_label_store")),
                Container(
                  margin: EdgeInsets.all(70),
                  height: 90.sp,
                  child: FlatButton(
                    color: Colors.black,
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(50)),
                    onPressed: () {
                      triggerRegister();
                    },
                    child: Text(
                      AppLocalization.of(context)
                          .translate("register_label_btn"),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Text(textResult)
              ],
            ),
          ),
        ),
      ),
    );
  }

  var selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  void triggerRegister() {
    setState(() {
      AppConstant.popBackStack(context, AppConstant.homeScreen);
    });
  }

  void triggerBack() {
    setState(() {
      AppConstant.replace(context, AppConstant.homeScreen);
    });
  }

  void triggerOpenCalendar() {
    setState(() {
      _selectDate(context);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    rePasswordController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    phoneController.dispose();
    postalCodeController.dispose();
    prefecturesController.dispose();
    cityController.dispose();
    addressController.dispose();
  }
}
