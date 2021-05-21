import 'dart:async';

import 'package:flutter/material.dart';
import 'package:trko/src/animations/page_transition.dart';
import 'package:trko/src/models/projects.dart';
import 'package:trko/src/scopedModel/project.dart';
import 'package:trko/src/screens/trkoHome.dart';
import 'package:trko/src/utils/closeNode.dart';
import 'package:trko/src/widgets/authProgress.dart';

// ignore: must_be_immutable
class CreateProject extends StatefulWidget {
  Project projecter;
  CreateProject({this.projecter});

  @override
  _CreateProjectState createState() => _CreateProjectState();
}

class _CreateProjectState extends State<CreateProject> {
  FocusNode nodeSecond = FocusNode();

  bool isApiCallProcess = false;

  Widget _uidStap(BuildContext context) {
    return GestureDetector(
      onTap: () => Utils().closeNode(context: context),
      onDoubleTap: () => Utils().closeNode(context: context),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          elevation: 0,
          toolbarHeight: 65,
          title: Text("Add/Edit Project"),
        ),
        body: Form(
          child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Title",
                      style: TextStyle(
                        fontSize: 15,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextField(
                    keyboardType: TextInputType.text,
                    maxLength: 20,
                    decoration: InputDecoration(
                      labelText: "",
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (String val) => Project().projectTitle = val,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Description",
                      style: TextStyle(
                        fontSize: 15,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextField(
                    maxLength: 300,
                    keyboardType: TextInputType.text,
                    onChanged: (String val) {
                      setState(() {
                        Project().projectDescription = val;
                      });
                    },
                    maxLengthEnforced: true,
                    maxLines: 5,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  MaterialButton(
                    onPressed: () async {
                      setState(() {
                        isApiCallProcess = true;
                      });
                      await ProjectModel()
                          .addProject(
                        title: Project().projectTitle,
                        description: Project().projectDescription,
                        categoryId: widget.projecter.categoryID,
                      )
                          .then((value) {
                        print(value);
                        print(widget.projecter.categoryID);
                        print(widget.projecter.projectDescription);
                        print(widget.projecter.projectTitle);
                        if (value != null) {
                          setState(() {
                            isApiCallProcess = false;
                          });

                          Navigator.of(context).pushReplacement(
                              PreviewSlideRoute(
                                  preview: TrkoHome(), duration: 200));
                          print(value);
                        } else {
                          setState(() {
                            isApiCallProcess = false;
                          });
                          print(value);
                          final snackBar = SnackBar(
                              content: Text("Error occured try again"));
                          SnackBar(content: Text("Error occured"));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      });
                    },
                    minWidth: Utils().screenWidth(context: context),
                    height: 60,
                    color: Theme.of(context).primaryColor,
                    child: Text(
                      "Add project",
                      style: TextStyle(
                          fontFamily: "Hz", fontSize: 19, color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ProgressHUD(
        inAsyncCall: isApiCallProcess, opacity: 0.3, child: _uidStap(context));
  }
}
