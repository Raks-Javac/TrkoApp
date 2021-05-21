class Project {
  String projectTitle;
  final String projectID;
  final String categoryID;
  final String createdAt;
  String projectDescription;
  Project(
      {this.projectID,
      this.createdAt,
      this.projectTitle,
      this.categoryID,
      this.projectDescription});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      '_id': projectID,
      'category_id': categoryID,
      'title': projectTitle,
      'description': projectDescription,
      'createdAt': createdAt
    };

    return map;
  }

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      projectID: json["_id"],
      projectTitle: json["title"],
      projectDescription: json["description"],
      categoryID: json['category_id'],
      createdAt: json['createdAt'],
    );
  }
}

class ProjectList {
  List<Project> projects;
  ProjectList({this.projects});

  factory ProjectList.fromJSON(Map<String, dynamic> json) {
    Iterable allprojects = json['data'];

    List projectsALL = allprojects.map((e) => Project.fromJson(e)).toList();

    return ProjectList(projects: projectsALL);
  }
}
