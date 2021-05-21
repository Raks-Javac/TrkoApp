import 'package:flutter/material.dart';
import 'package:trko/src/animations/page_transition.dart';
import 'package:trko/src/models/projects.dart';
import 'package:trko/src/scopedModel/project.dart';
import 'package:trko/src/screens/project.dart/projectDetails.dart';
import 'package:trko/src/utils/closeNode.dart';
import 'package:trko/src/widgets/loader.dart';

class Projects extends StatefulWidget {
  @override
  _ProjectsState createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
  Future<ProjectList> _future;
  @override
  void initState() {
    super.initState();
    _future = ProjectModel().getProjects();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ProjectList>(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(
                margin: EdgeInsets.only(top: 10.0),
                child: ListView.separated(
                  itemBuilder: (_, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          PreviewSlideRoute(
                              preview: ProjectDetails(
                                pp: snapshot.data.projects[index],
                              ),
                              duration: 200),
                        );
                      },
                      child: ProjectTile(
                        project: snapshot.data.projects[index],
                      ),
                    );
                  },
                  separatorBuilder: (_, __) => SizedBox(
                    height: 10.0,
                  ),
                  itemCount: snapshot.data.projects.length,
                ));
          } else if (snapshot.hasError || !snapshot.hasData) {
            return Loader();
          } else {
            return Loader();
          }
        });
  }
}

class ProjectTile extends StatelessWidget {
  final Project project;
  const ProjectTile({this.project});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.0,
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      width: Utils().screenWidth(context: context),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 0.5),
          borderRadius: BorderRadius.circular(10.0)),
      child: Center(
        child: ListTile(
          title: Text(
            project.projectTitle,
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              "${project.projectDescription}",
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 14,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
