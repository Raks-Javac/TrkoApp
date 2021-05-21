import 'package:flutter/material.dart';
import 'package:trko/src/models/in_appData.dart';
import 'package:trko/src/screens/trkoSplashScreen.dart';
import 'package:trko/src/theme/customTheme.dart';

void main() {
  runApp(TrkoApp());
}

class TrkoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //the InAppUse.appName is a property accessed from the InAppUse class
      //InAppUse class contains all the data of the app Strings and other resusable properties
      title: InAppUse().appName,
      debugShowCheckedModeBanner: false,

      //CustomTheme class is a class predefined to enable custom theming in the app in future builds
      theme: CustomTheme.lightTheme,

      //The trkoSplashScreen is the first Widget displayed in the app
      home: TrkoSplashScreen(),
    );
  }
}
