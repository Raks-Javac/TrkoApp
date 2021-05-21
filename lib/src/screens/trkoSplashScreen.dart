import 'package:flutter/material.dart';
import 'package:trko/src/animations/page_transition.dart';
import 'package:trko/src/screens/trkoHome.dart';
import 'package:trko/src/screens/trkoSignIn.dart';

import 'package:trko/src/utils/closeNode.dart';
import 'package:trko/src/widgets/logoWidth.dart';

class TrkoSplashScreen extends StatefulWidget {
  @override
  _TrkoSplashScreenState createState() => _TrkoSplashScreenState();
}

class _TrkoSplashScreenState extends State<TrkoSplashScreen> {
  @override
  void initState() {
    super.initState();
    _popOffStackSplashScreen();
  }

// this method navigates the splash Screen to another screen after a certain future is attained

  Future<void> _popOffStackSplashScreen() {
    return Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
          PreviewSlideRoute(preview: TrkoSignIn(), duration: 200));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Container(
        child: Center(
          //The Column as the parent widget is for future refractoring
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              LogoWidget(
                logoWidth: Utils().screenWidth(context: context) / 1.4,
              )
            ],
          ),
        ),
      ),
    );
  }
}
