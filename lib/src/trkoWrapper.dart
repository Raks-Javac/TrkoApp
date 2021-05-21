//the wrapper decides the screen to be displayed after response from a server or local Storage

import 'package:flutter/material.dart';
import 'package:trko/src/screens/trkoSignIn.dart';

class TrkoWrapper extends StatefulWidget {
  @override
  _TrkoWrapperState createState() => _TrkoWrapperState();
}

class _TrkoWrapperState extends State<TrkoWrapper> {
  @override
  Widget build(BuildContext context) {
    return TrkoSignIn();
  }
}
