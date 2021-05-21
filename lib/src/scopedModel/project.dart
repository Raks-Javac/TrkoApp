import 'dart:convert';

import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;
import 'package:trko/src/models/projects.dart';

class ProjectModel extends Model {
  Future<Project> addProject(
      {String title, String description, String categoryId}) async {
    String url = "https://api.uatdrive.com:1001/api/v1/projects/";
    final response = await http.post(
      url,
      body: json.encode({
        "category_id": "602a4a475088782c30f24941",
        "title": "project V",
        "description":
            " This is a very important piece of art that needs to be kdkdkfkf ",
      }),
      headers: <String, String>{
        'authorization':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjdXJyZW50VXNlciI6eyJfaWQiOiI2MDIyZTg4ZjYxY2UzMTRlODRhMzljN2IiLCJlbWFpbCI6ImpvaG5kb2VAZ21haWwuY29tIn0sImlhdCI6MTYxMjk0NzA2MH0.yYAl_DwLyp-s0XJ8DrgDQxO9wsshDAvsVP6H1IhMUVs',
      },
    );

    if (response.statusCode == 200) {
      print(response.body);
      return Project.fromJson(jsonDecode(response.body));
    } else if (response.statusCode == 400) {
      print(response.body);
      return null;
    } else {
      print(response.body);
      return null;
    }
  }

  Future<ProjectList> getProjects() async {
    String url = "https://api.uatdrive.com:1001/api/v1/projects";

    final response = await http.get(
      url,
      headers: <String, String>{
        'authorization':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjdXJyZW50VXNlciI6eyJfaWQiOiI2MDIyZTg4ZjYxY2UzMTRlODRhMzljN2IiLCJlbWFpbCI6ImpvaG5kb2VAZ21haWwuY29tIn0sImlhdCI6MTYxMjk0NzA2MH0.yYAl_DwLyp-s0XJ8DrgDQxO9wsshDAvsVP6H1IhMUVs',
      },
    );

    if (response.statusCode == 200) {
      // print(response.body);
      return ProjectList.fromJSON(json.decode(response.body));
    } else {
      // If the server did not return a 200 CREATED response,
      // then throw an exception.
      throw Exception('Failed to login');
    }

    // return ProjectList.fromJSON(json.decode(response.body));
  }
}
