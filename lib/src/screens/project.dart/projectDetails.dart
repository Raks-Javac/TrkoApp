import 'package:flutter/material.dart';
import 'package:trko/src/animations/page_transition.dart';
import 'package:trko/src/models/projects.dart';
import 'package:trko/src/screens/project.dart/projectCreate.dart';
import 'package:trko/src/utils/closeNode.dart';

// ignore: must_be_immutable
class ProjectDetails extends StatelessWidget {
  ProjectDetails({this.pp});

  Project pp;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        title: Text("${pp.projectTitle}"),
        automaticallyImplyLeading: true,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            Text(
              "${pp.projectDescription}",
              style: TextStyle(
                  letterSpacing: 1.0,
                  fontFamily: "Hz",
                  fontSize: 15,
                  color: Colors.black),
            ),
            SizedBox(
              height: 30,
            ),
            MaterialButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(PreviewSlideRoute(
                    preview: CreateProject(
                      projecter: pp,
                    ),
                    duration: 200));
              },
              minWidth: Utils().screenWidth(context: context),
              height: 60,
              color: Theme.of(context).primaryColor,
              child: Text(
                "Edit project",
                style: TextStyle(
                    fontFamily: "Hz", fontSize: 19, color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
