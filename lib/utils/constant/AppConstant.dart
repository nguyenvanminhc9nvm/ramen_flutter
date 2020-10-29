import 'package:flutter/material.dart';

class AppConstant {
  static final introScreen = "lib/ui/main/IntroScreen.dart";
  static final registerScreen = "lib/ui/register/RegisterScreen.dart";
  static final homeScreen = "lib/ui/home/HomeScreen.dart";
  static final splashScreen = "lib/ui/splash/SplashScreen.dart";
  //image
  static final iconIntro = "assets/icon_intro.png";
  static final iconStart = "assets/icon_start_intro.png";
  static final iconSecond = "assets/icon_intro_two.png";
  static final iconThird = "assets/icon_intro_three.png";
  static final iconFour = "assets/intro_4.png";
  static final iconFive = "assets/icon_start_five.png";
  static final iconSix = "assets/icon_start_six.png";
  static final iconPrevious = "assets/icon_previour.png";
  static final iconNext = "assets/icon_next_intro.png";
  static final iconArrow = "assets/icon_arrow.png";
  static final iconMenu = "assets/icon_navigation_menu.png";
  static final iconStore = "assets/icon_navigation_store.png";
  static final iconTakeout = "assets/icon_navigation_take_out.png";
  static final iconOfficeSite = "assets/icon_navigation_office_site.png";
  static final iconQuestionNaire = "assets/icon_navigation_question_naire.png";
  static final iconYoutube = "assets/icon_navigation_youtube.png";
  static final iconAbuRaSoBa = "assets/icon_oil_soba_custom.png";
  ///font
  static final fontBeBas = "Bebas";
  static final fontMyriad = "Myriad";
  static final fontHanSansMedium = "SourceHanSanMedium";
  static final fontHanSansNormal = "SourceHanSanNormal";
  /// public function switch screen
  static void navigate(BuildContext context, screen) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
  }

  static void popBack(BuildContext context) {
    Navigator.pop(context);
  }

  static void popBackStack(BuildContext context, String screen) {
    Navigator.popUntil(context, (route) => false);
  }

  static void replace(BuildContext context, String screen) {
    Navigator.pushNamedAndRemoveUntil(context, screen, (route) => false);
  }
}

