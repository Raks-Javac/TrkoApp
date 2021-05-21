import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:trko/src/animations/page_transition.dart';
import 'package:trko/src/models/user.dart';
import 'package:trko/src/scopedModel/auth.dart';
import 'package:trko/src/screens/trkoHome.dart';
import 'package:trko/src/screens/trkoRegister.dart';

import 'package:trko/src/utils/closeNode.dart';
import 'package:trko/src/widgets/authProgress.dart';
import 'package:trko/src/widgets/logoWidth.dart';
import 'package:trko/src/widgets/textFormFieldWidget.dart';

// ignore: must_be_immutable
class TrkoSignIn extends StatefulWidget {
  @override
  _TrkoSignInState createState() => _TrkoSignInState();
}

class _TrkoSignInState extends State<TrkoSignIn> {
  bool hidePassword = true;
  bool isApiCallProcess = false;

  final _formKey = GlobalKey<FormState>();

  User user;

  final FocusNode nodeFirst = FocusNode();

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final FocusNode nodeSecond = FocusNode();

  @override
  void initState() {
    user = User();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final _auth = ScopedModel.of<Auth>(context, rebuildOnChange: true);
    return ScopedModel<Auth>(
      model: Auth(),
      child: ProgressHUD(
          inAsyncCall: isApiCallProcess, opacity: 0.3, child: _uidStap()),
    );
  }

  Scaffold _uidStap() {
    return Scaffold(
      body: ScopedModelDescendant<Auth>(
        builder: (context, child, model) => Form(
          key: _formKey,
          child: GestureDetector(
            onTap: () => Utils().closeNode(context: context),
            onDoubleTap: () => Utils().closeNode(context: context),
            child: Container(
              child: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 30.0,
                    vertical: 40,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: LogoWidget(
                          logoWidth:
                              Utils().screenWidth(context: context) / 2.3,
                        ),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      TextFieldWidget(
                        validator: (String val) =>
                            (val.isEmpty || val.length < 8)
                                ? "Enter a valid email"
                                : null,
                        obscureText: false,
                        node: nodeFirst,
                        textFieldText: "Email",
                        textField: (String val) => user.email = val,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFieldWidget(
                        validator: (String val) =>
                            (val.isEmpty || val.length < 8)
                                ? "Password must be 8+ character"
                                : null,
                        obscureText: true,
                        node: nodeSecond,
                        textFieldText: "Password",
                        textField: (val) => user.password = val,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      MaterialButton(
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            print(user.toJson());

                            setState(() {
                              isApiCallProcess = true;
                            });

                            Auth apiService = new Auth();

                            print(user.toJson());
                            apiService
                                .login(user.email, user.password)
                                .then((value) {
                              if (value != null) {
                                setState(() {
                                  isApiCallProcess = false;
                                });
                                Navigator.of(context).pushReplacement(
                                    PreviewSlideRoute(
                                        preview: TrkoHome(), duration: 200));
                              } else if (value == null) {
                                setState(() {
                                  isApiCallProcess = false;
                                });
                                final snackBar = SnackBar(
                                    content: Text("Login credential error"));
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              } else {
                                final snackBar =
                                    SnackBar(content: Text("Error occured"));
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              }
                            });
                          } else {}
                        },
                        minWidth: Utils().screenWidth(context: context),
                        color: Theme.of(context).primaryColor,
                        height: 60,
                        child: Text(
                          "Login",
                          style: TextStyle(
                              fontFamily: "Hz",
                              color: Colors.white,
                              fontSize: 20),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      MaterialButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              PreviewSlideRoute(
                                  preview: TrkoRegister(), duration: 200));
                        },
                        minWidth: Utils().screenWidth(context: context),
                        height: 60,
                        child: Text(
                          "Register",
                          style: TextStyle(
                              fontFamily: "Hz",
                              fontSize: 20,
                              color: Colors.grey),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
