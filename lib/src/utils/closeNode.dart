import 'package:flutter/material.dart';

// this class store functions and utility needed in the app
class Utils {
  //function to close keyboard and exit textField focusNode
  void closeNode({BuildContext context}) {
    FocusScope.of(context).requestFocus(new FocusNode());
  }

  //function to get the screen Width
  double screenWidth({BuildContext context}) {
    return MediaQuery.of(context).size.width;
  }

//function to get the screen Height
  double screenHeight({BuildContext context}) {
    return MediaQuery.of(context).size.height;
  }
}
