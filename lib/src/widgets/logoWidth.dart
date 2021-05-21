import 'package:flutter/material.dart';
import 'package:trko/src/models/in_appData.dart';

class LogoWidget extends StatelessWidget {
  final double logoWidth;
  const LogoWidget({this.logoWidth});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      ImageHandler().logo,
      width: logoWidth,
    );
  }
}
