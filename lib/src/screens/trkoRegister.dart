import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:trko/src/animations/page_transition.dart';
import 'package:trko/src/models/user.dart';
import 'package:trko/src/scopedModel/auth.dart';
import 'package:trko/src/screens/trkoHome.dart';
import 'package:trko/src/screens/trkoSignIn.dart';

import 'package:trko/src/utils/closeNode.dart';
import 'package:trko/src/widgets/authProgress.dart';
import 'package:trko/src/widgets/logoWidth.dart';
import 'package:trko/src/widgets/textFormFieldWidget.dart';

// ignore: must_be_immutable
class TrkoRegister extends StatefulWidget {
  @override
  _TrkoRegisterState createState() => _TrkoRegisterState();
}

class _TrkoRegisterState extends State<TrkoRegister> {
  final _formKey = GlobalKey<FormState>();
  bool isApiCallProcess = false;
  final FocusNode nodeFirst = FocusNode();
  User user;
  final FocusNode nodeSecond = FocusNode();

  final FocusNode nodeThird = FocusNode();

  @override
  void initState() {
    user = User();
    super.initState();
  }

  Widget _uidStap() {
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
                    vertical: 30,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: LogoWidget(
                          logoWidth:
                              Utils().screenWidth(context: context) / 2.4,
                        ),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      TextFieldWidget(
                        validator: (String val) =>
                            model.emailCondition(val: val),
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
                            model.passwordCondition(val: val),
                        obscureText: true,
                        node: nodeSecond,
                        textFieldText: "Password",
                        textField: (String val) => user.password = val,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFieldWidget(
                        validator: (String val) => model
                            .confirmPasswordCondition(val: val, user: user),
                        obscureText: true,
                        node: nodeThird,
                        textFieldText: "ReType-Password",
                        textField: (String val) => user.password = val,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      MaterialButton(
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            print(user.toJson());
                            print(user.toJson());

                            setState(() {
                              isApiCallProcess = true;
                            });

                            Auth apiService = new Auth();

                            print(user.toJson());
                            apiService
                                .register(user.email, user.password)
                                .then((value) {
                              if (value != null) {
                                setState(() {
                                  isApiCallProcess = false;
                                });
                                Navigator.of(context).pushReplacement(
                                    PreviewSlideRoute(
                                        preview: TrkoSignIn(), duration: 200));
                              } else if (value == null) {
                                setState(() {
                                  isApiCallProcess = false;
                                });
                                final snackBar = SnackBar(
                                    content: Text("Registration issues"));
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
                          "Register",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      MaterialButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              PreviewSlideRoute(
                                  preview: TrkoSignIn(), duration: 200));
                        },
                        minWidth: Utils().screenWidth(context: context),
                        height: 60,
                        child: Text(
                          "Login",
                          style: TextStyle(fontSize: 20, color: Colors.grey),
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

  @override
  Widget build(BuildContext context) {
    return ScopedModel<Auth>(
      model: Auth(),
      child: ProgressHUD(
          inAsyncCall: isApiCallProcess, opacity: 0.3, child: _uidStap()),
    );
  }
}
