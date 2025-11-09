import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/material.dart';
import 'package:portfolio_app/models/project.dart';

class DataService with ChangeNotifier {
  List<Project> _projects = [];

  List<Project> get projects => _projects;

  Future<List<Project>> loadProjects() async {
    if (_projects.isNotEmpty) {
      return _projects;
    }
    final String jsonString = await rootBundle.loadString('assets/data.json');
    final List<dynamic> jsonList = json.decode(jsonString) as List<dynamic>;
    _projects = jsonList.map((json) => Project.fromJson(json)).toList();
    notifyListeners();
    return _projects;
  }
}
