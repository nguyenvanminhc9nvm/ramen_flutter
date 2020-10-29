import 'package:flutter/cupertino.dart';
import 'package:flutter_app/utils/localize/AppLocalizations.dart';

extension ConvertStringExtensions on String {

  static String getText(context, key) =>  AppLocalization.of(context).translate(key);

}