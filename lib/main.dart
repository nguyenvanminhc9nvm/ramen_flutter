
import 'package:flutter/material.dart';
import 'package:flutter_app/ui/home/HomeScreen.dart';
import 'package:flutter_app/ui/main/IntroScreen.dart';
import 'package:flutter_app/ui/register/RegisterScreen.dart';
import 'package:flutter_app/ui/splash/SplashScreen.dart';
import 'package:flutter_app/utils/constant/AppConstant.dart';
import 'package:flutter_app/utils/localize/AppLocalizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(new MaterialApp(
      home: new SplashScreen(),
      routes: <String, WidgetBuilder>{
        AppConstant.introScreen: (BuildContext context) =>
            new IntroScreen(),
        AppConstant.registerScreen: (BuildContext context) =>
            new RegisterScreen(),
        AppConstant.homeScreen: (BuildContext context) =>
            new HomeScreen()
      },
      debugShowCheckedModeBanner: false,
      supportedLocales: [
        Locale('vi', 'VN'),
        Locale('en', 'US'),
      ],
      // These delegates make sure that the localization data for the proper language is loaded
      localizationsDelegates: [
        // THIS CLASS WILL BE ADDED LATER
        // A class which loads the translations from JSON files
        AppLocalization.delegate,
        // Built-in localization of basic text for Material widgets
        GlobalMaterialLocalizations.delegate,
        // Built-in localization for text direction LTR/RTL
        GlobalWidgetsLocalizations.delegate,
      ],
      // Returns a locale which will be used by the app
      localeResolutionCallback: (locale, supportedLocales) {
        // Check if the current device locale is supported
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale.languageCode &&
              supportedLocale.countryCode == locale.countryCode) {
            return supportedLocale;
          }
        }
        // If the locale of the device is not supported, use the first one
        // from the list (English, in this case).
        return supportedLocales.first;
      }));


}
